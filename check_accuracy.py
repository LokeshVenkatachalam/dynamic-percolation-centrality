def read_numbers(filename):
    with open(filename, 'r') as file:
        # Read the entire file and split by whitespace
        content = file.read()
        # Convert each split element to float
        numbers = [float(num) for num in content.split()]
    return numbers

def compare_numbers(list1, list2, tol=1e-6):
    """
    Compare two lists of numbers element by element within a given tolerance.
    
    Parameters:
        list1 (list of float): First list of numbers.
        list2 (list of float): Second list of numbers.
        tol (float): Tolerance value for considering two numbers as equal.
    
    Returns:
        A tuple (match_count, accuracy, avg_abs_diff, max_abs_diff, num_compared)
    """
    min_len = min(len(list1), len(list2))
    match_count = 0
    total_abs_diff = 0.0
    max_abs_diff = 0.0
    
    for i in range(min_len):
        diff = abs(list1[i] - list2[i])
        total_abs_diff += diff
        max_abs_diff = max(max_abs_diff, diff)
        # Count as match if the difference is within the tolerance
        if diff <= tol:
            match_count += 1
            
    avg_abs_diff = total_abs_diff / min_len if min_len > 0 else 0.0
    accuracy = (match_count / min_len) * 100 if min_len > 0 else 0.0
    return match_count, accuracy, avg_abs_diff, max_abs_diff, min_len

# Specify the file paths including the folder 'output'
file1 = "output/p1_q10_cpu_dynedge_PGPgiantcompo.txt"
file2 = "output/p1_q10_cpu_statedge_PGPgiantcompo.txt"

# Read numbers from both files
numbers1 = read_numbers(file1)
numbers2 = read_numbers(file2)

# Set a tolerance value to account for lower precision differences (adjust if needed)
tolerance = 1e-6
match_count, accuracy, avg_diff, max_diff, num_compared = compare_numbers(numbers1, numbers2, tol=tolerance)

print(f"Compared {num_compared} numbers from each file.")
print(f"Matching count within tolerance (±{tolerance}): {match_count}")
print(f"Accuracy of match: {accuracy:.2f}%")
print(f"Average absolute difference: {avg_diff:.6f}")
print(f"Maximum absolute difference: {max_diff:.6f}")

# Warn if the files have different numbers of elements
if len(numbers1) != len(numbers2):
    print("Warning: The files have different numbers of elements.")
