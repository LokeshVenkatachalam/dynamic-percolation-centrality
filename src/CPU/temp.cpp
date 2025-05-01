std::queue<int>               q;
std::stack<int>               st;
std::vector<int>              dist(N+1, -1);
std::vector<double>           sig(N+1, 0.0);
std::vector<double>           new_delta(N+1, 0.0);
std::vector<double>           old_delta(N+1, 0.0);
std::vector<std::vector<int>> pr(N+1);
for (int i = 0; i < batch_size; ++i) {


// call the standard Brandes update, accumulating into ptr
update_brandes(
    query_nodes[i],
    node,
    x,
    updated_x,
    tmp_g,
    reach,
    ptr,      // directly updated
    rep,
    q,
    st,
    dist,
    sig,
    new_delta,
    old_delta,
    pr
);


#pragma omp for schedule(dynamic,1) reduction(+: ptr[:V+1])
for (int i = 0; i < batch_size; ++i) {
    // clear only the parts you touched last iteration
    // (e.g. reset dist[v] for visited v, clear q/st, etc.)
    update_brandes(
        query_nodes[i],
        node,
        x, updated_x,
        tmp_g, reach,
        ptr,  rep,
        q, st,
        dist,
        sig, new_delta, old_delta,
        pr
    );
}

int num_threads = omp_get_max_threads();

// Shared 2D array: each thread writes to its own row
std::vector<std::vector<double>> local_ptr(num_threads, std::vector<double>(N+1, 0.0));

#pragma omp parallel
{
    int tid = omp_get_thread_num();

    // per-thread scratch space (allocated once per thread)
    std::queue<int>               q;
    std::stack<int>               st;
    std::vector<int>              dist(N+1, -1);
    std::vector<double>           sig(N+1, 0.0);
    std::vector<double>           new_delta(N+1, 0.0);
    std::vector<double>           old_delta(N+1, 0.0);
    std::vector<std::vector<int>> pr(N+1);

    // 1) Dynamic “finding” phase: each thread accumulates into its local_ptr row
    #pragma omp for schedule(dynamic,1) nowait
    for (int i = 0; i < batch_size; ++i) {
        update_brandes(
            query_nodes[i],
            node,
            x,
            updated_x,
            tmp_g,
            reach,
            local_ptr[tid],  // accumulate here
            rep,
            q,
            st,
            dist,
            sig,
            new_delta,
            old_delta,
            pr
        );
    }

    // 2) Reduction phase: combine local_ptr rows into the shared ptr array
    #pragma omp barrier  // ensure finding phase is complete
    #pragma omp for schedule(static)
    for (int v = 0; v <= N; ++v) {
        double sum = 0.0;
        for (int t = 0; t < num_threads; ++t) {
            sum += local_ptr[t][v];
        }
        ptr[v] = sum;
    }
}