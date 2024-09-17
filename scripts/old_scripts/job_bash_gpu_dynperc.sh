#!/bin/bash
#SBATCH -w node05
# output=p48_gpu_dynperc.txt  
# python3 run.py --algorithm dynperc --dataset brightkite         --batch 1   --gpu -o p48_q1_gpu_brightkite.txt            &>> $output
# python3 run.py --algorithm dynperc --dataset brightkite         --batch 10  --gpu -o p48_q10_gpu_brightkite.txt           &>> $output
# python3 run.py --algorithm dynperc --dataset brightkite         --batch 40  --gpu -o p48_q40_gpu_brightkite.txt           &>> $output
# python3 run.py --algorithm dynperc --dataset brightkite         --batch 100 --gpu -o p48_q100_gpu_brightkite.txt          &>> $output
# python3 run.py --algorithm dynperc --dataset email-enron        --batch 1   --gpu -o p48_q1_gpu_email-enron.txt           &>> $output
# python3 run.py --algorithm dynperc --dataset email-enron        --batch 10  --gpu -o p48_q10_gpu_email-enron.txt          &>> $output
# python3 run.py --algorithm dynperc --dataset email-enron        --batch 40  --gpu -o p48_q40_gpu_email-enron.txt          &>> $output
# python3 run.py --algorithm dynperc --dataset email-enron        --batch 100 --gpu -o p48_q100_gpu_email-enron.txt         &>> $output
# python3 run.py --algorithm dynperc --dataset facebook           --batch 1   --gpu -o p48_q1_gpu_facebook.txt              &>> $output
# python3 run.py --algorithm dynperc --dataset facebook           --batch 10  --gpu -o p48_q10_gpu_facebook.txt             &>> $output
# python3 run.py --algorithm dynperc --dataset facebook           --batch 40  --gpu -o p48_q40_gpu_facebook.txt             &>> $output
# python3 run.py --algorithm dynperc --dataset facebook           --batch 100 --gpu -o p48_q100_gpu_facebook.txt            &>> $output
# python3 run.py --algorithm dynperc --dataset hi2010             --batch 1   --gpu -o p48_q1_gpu_hi2010.txt                &>> $output
# python3 run.py --algorithm dynperc --dataset hi2010             --batch 10  --gpu -o p48_q10_gpu_hi2010.txt               &>> $output
# python3 run.py --algorithm dynperc --dataset hi2010             --batch 40  --gpu -o p48_q40_gpu_hi2010.txt               &>> $output
# python3 run.py --algorithm dynperc --dataset hi2010             --batch 100 --gpu -o p48_q100_gpu_hi2010.txt              &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella24     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella24.txt        &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella24     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella24.txt       &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella24     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella24.txt       &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella24     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella24.txt      &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella25     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella25.txt        &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella25     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella25.txt       &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella25     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella25.txt       &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella25     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella25.txt      &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella30     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella30.txt        &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella30     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella30.txt       &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella30     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella30.txt       &>> $output
# python3 run.py --algorithm dynperc --dataset p2p-Gnutella30     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella30.txt      &>> $output
# python3 run.py --algorithm dynperc --dataset PGPgiantcompo      --batch 1   --gpu -o p48_q1_gpu_PGPgiantcompo.txt         &>> $output
# python3 run.py --algorithm dynperc --dataset PGPgiantcompo      --batch 10  --gpu -o p48_q10_gpu_PGPgiantcompo.txt        &>> $output
# python3 run.py --algorithm dynperc --dataset PGPgiantcompo      --batch 40  --gpu -o p48_q40_gpu_PGPgiantcompo.txt        &>> $output
# python3 run.py --algorithm dynperc --dataset PGPgiantcompo      --batch 100 --gpu -o p48_q100_gpu_PGPgiantcompo.txt       &>> $output
# python3 run.py --algorithm dynperc --dataset slashdot           --batch 1   --gpu -o p48_q1_gpu_slashdot.txt              &>> $output
# python3 run.py --algorithm dynperc --dataset slashdot           --batch 10  --gpu -o p48_q10_gpu_slashdot.txt             &>> $output
# python3 run.py --algorithm dynperc --dataset slashdot           --batch 40  --gpu -o p48_q40_gpu_slashdot.txt             &>> $output
# python3 run.py --algorithm dynperc --dataset slashdot           --batch 100 --gpu -o p48_q100_gpu_slashdot.txt            &>> $output
# python3 run.py --algorithm dynperc --dataset web-indochina-2004 --batch 1   --gpu -o p48_q1_gpu_web-indochina-2004.txt    &>> $output
# python3 run.py --algorithm dynperc --dataset web-indochina-2004 --batch 10  --gpu -o p48_q10_gpu_web-indochina-2004.txt   &>> $output
# python3 run.py --algorithm dynperc --dataset web-indochina-2004 --batch 40  --gpu -o p48_q40_gpu_web-indochina-2004.txt   &>> $output
# python3 run.py --algorithm dynperc --dataset web-indochina-2004 --batch 100 --gpu -o p48_q100_gpu_web-indochina-2004.txt  &>> $output
# python3 run.py --algorithm dynperc --dataset web-standford      --batch 1   --gpu -o p48_q1_gpu_web-standford.txt         &>> $output
# python3 run.py --algorithm dynperc --dataset web-standford      --batch 10  --gpu -o p48_q10_gpu_web-standford.txt        &>> $output
# python3 run.py --algorithm dynperc --dataset web-standford      --batch 40  --gpu -o p48_q40_gpu_web-standford.txt        &>> $output
# python3 run.py --algorithm dynperc --dataset web-standford      --batch 100 --gpu -o p48_q100_gpu_web-standford.txt       &>> $output
# python3 run.py --algorithm dynperc --dataset web-webbase-2001   --batch 1   --gpu -o p48_q1_gpu_web-webbase-2001.txt      &>> $output
# python3 run.py --algorithm dynperc --dataset web-webbase-2001   --batch 10  --gpu -o p48_q10_gpu_web-webbase-2001.txt     &>> $output
# python3 run.py --algorithm dynperc --dataset web-webbase-2001   --batch 40  --gpu -o p48_q40_gpu_web-webbase-2001.txt     &>> $output
# python3 run.py --algorithm dynperc --dataset web-webbase-2001   --batch 100 --gpu -o p48_q100_gpu_web-webbase-2001.txt    &>> $output
# python3 run.py --algorithm dynperc --dataset wikiVote           --batch 1   --gpu -o p48_q1_gpu_wikiVote.txt              &>> $output
# python3 run.py --algorithm dynperc --dataset wikiVote           --batch 10  --gpu -o p48_q10_gpu_wikiVote.txt             &>> $output
# python3 run.py --algorithm dynperc --dataset wikiVote           --batch 40  --gpu -o p48_q40_gpu_wikiVote.txt             &>> $output
# python3 run.py --algorithm dynperc --dataset wikiVote           --batch 100 --gpu -o p48_q100_gpu_wikiVote.txt            &>> $output

output=p48_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset brightkite         --batch 1   --gpu -o p48_q1_gpu_brightkite.txt            &>> $output
python3 run.py --algorithm statperc --dataset brightkite         --batch 10  --gpu -o p48_q10_gpu_brightkite.txt           &>> $output
python3 run.py --algorithm statperc --dataset brightkite         --batch 40  --gpu -o p48_q40_gpu_brightkite.txt           &>> $output
python3 run.py --algorithm statperc --dataset brightkite         --batch 100 --gpu -o p48_q100_gpu_brightkite.txt          &>> $output
python3 run.py --algorithm statperc --dataset email-enron        --batch 1   --gpu -o p48_q1_gpu_email-enron.txt           &>> $output
python3 run.py --algorithm statperc --dataset email-enron        --batch 10  --gpu -o p48_q10_gpu_email-enron.txt          &>> $output
python3 run.py --algorithm statperc --dataset email-enron        --batch 40  --gpu -o p48_q40_gpu_email-enron.txt          &>> $output
python3 run.py --algorithm statperc --dataset email-enron        --batch 100 --gpu -o p48_q100_gpu_email-enron.txt         &>> $output
python3 run.py --algorithm statperc --dataset facebook           --batch 1   --gpu -o p48_q1_gpu_facebook.txt              &>> $output
python3 run.py --algorithm statperc --dataset facebook           --batch 10  --gpu -o p48_q10_gpu_facebook.txt             &>> $output
python3 run.py --algorithm statperc --dataset facebook           --batch 40  --gpu -o p48_q40_gpu_facebook.txt             &>> $output
python3 run.py --algorithm statperc --dataset facebook           --batch 100 --gpu -o p48_q100_gpu_facebook.txt            &>> $output
python3 run.py --algorithm statperc --dataset hi2010             --batch 1   --gpu -o p48_q1_gpu_hi2010.txt                &>> $output
python3 run.py --algorithm statperc --dataset hi2010             --batch 10  --gpu -o p48_q10_gpu_hi2010.txt               &>> $output
python3 run.py --algorithm statperc --dataset hi2010             --batch 40  --gpu -o p48_q40_gpu_hi2010.txt               &>> $output
python3 run.py --algorithm statperc --dataset hi2010             --batch 100 --gpu -o p48_q100_gpu_hi2010.txt              &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella24     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella24.txt        &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella24     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella24.txt       &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella24     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella24.txt       &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella24     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella24.txt      &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella25     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella25.txt        &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella25     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella25.txt       &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella25     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella25.txt       &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella25     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella25.txt      &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella30     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella30.txt        &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella30     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella30.txt       &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella30     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella30.txt       &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella30     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella30.txt      &>> $output
python3 run.py --algorithm statperc --dataset PGPgiantcompo      --batch 1   --gpu -o p48_q1_gpu_PGPgiantcompo.txt         &>> $output
python3 run.py --algorithm statperc --dataset PGPgiantcompo      --batch 10  --gpu -o p48_q10_gpu_PGPgiantcompo.txt        &>> $output
python3 run.py --algorithm statperc --dataset PGPgiantcompo      --batch 40  --gpu -o p48_q40_gpu_PGPgiantcompo.txt        &>> $output
python3 run.py --algorithm statperc --dataset PGPgiantcompo      --batch 100 --gpu -o p48_q100_gpu_PGPgiantcompo.txt       &>> $output
python3 run.py --algorithm statperc --dataset slashdot           --batch 1   --gpu -o p48_q1_gpu_slashdot.txt              &>> $output
python3 run.py --algorithm statperc --dataset slashdot           --batch 10  --gpu -o p48_q10_gpu_slashdot.txt             &>> $output
python3 run.py --algorithm statperc --dataset slashdot           --batch 40  --gpu -o p48_q40_gpu_slashdot.txt             &>> $output
python3 run.py --algorithm statperc --dataset slashdot           --batch 100 --gpu -o p48_q100_gpu_slashdot.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-indochina-2004 --batch 1   --gpu -o p48_q1_gpu_web-indochina-2004.txt    &>> $output
python3 run.py --algorithm statperc --dataset web-indochina-2004 --batch 10  --gpu -o p48_q10_gpu_web-indochina-2004.txt   &>> $output
python3 run.py --algorithm statperc --dataset web-indochina-2004 --batch 40  --gpu -o p48_q40_gpu_web-indochina-2004.txt   &>> $output
python3 run.py --algorithm statperc --dataset web-indochina-2004 --batch 100 --gpu -o p48_q100_gpu_web-indochina-2004.txt  &>> $output
python3 run.py --algorithm statperc --dataset web-standford      --batch 1   --gpu -o p48_q1_gpu_web-standford.txt         &>> $output
python3 run.py --algorithm statperc --dataset web-standford      --batch 10  --gpu -o p48_q10_gpu_web-standford.txt        &>> $output
python3 run.py --algorithm statperc --dataset web-standford      --batch 40  --gpu -o p48_q40_gpu_web-standford.txt        &>> $output
python3 run.py --algorithm statperc --dataset web-standford      --batch 100 --gpu -o p48_q100_gpu_web-standford.txt       &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001   --batch 1   --gpu -o p48_q1_gpu_web-webbase-2001.txt      &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001   --batch 10  --gpu -o p48_q10_gpu_web-webbase-2001.txt     &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001   --batch 40  --gpu -o p48_q40_gpu_web-webbase-2001.txt     &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001   --batch 100 --gpu -o p48_q100_gpu_web-webbase-2001.txt    &>> $output
python3 run.py --algorithm statperc --dataset wikiVote           --batch 1   --gpu -o p48_q1_gpu_wikiVote.txt              &>> $output
python3 run.py --algorithm statperc --dataset wikiVote           --batch 10  --gpu -o p48_q10_gpu_wikiVote.txt             &>> $output
python3 run.py --algorithm statperc --dataset wikiVote           --batch 40  --gpu -o p48_q40_gpu_wikiVote.txt             &>> $output
python3 run.py --algorithm statperc --dataset wikiVote           --batch 100 --gpu -o p48_q100_gpu_wikiVote.txt            &>> $output

# output=p48_gpu_dynedge.txt  
# python3 run.py --algorithm dynedge --dataset brightkite         --batch 1   --gpu -o p48_q1_gpu_brightkite.txt            &>> $output
# python3 run.py --algorithm dynedge --dataset brightkite         --batch 10  --gpu -o p48_q10_gpu_brightkite.txt           &>> $output
# python3 run.py --algorithm dynedge --dataset brightkite         --batch 40  --gpu -o p48_q40_gpu_brightkite.txt           &>> $output
# python3 run.py --algorithm dynedge --dataset brightkite         --batch 100 --gpu -o p48_q100_gpu_brightkite.txt          &>> $output
# python3 run.py --algorithm dynedge --dataset email-enron        --batch 1   --gpu -o p48_q1_gpu_email-enron.txt           &>> $output
# python3 run.py --algorithm dynedge --dataset email-enron        --batch 10  --gpu -o p48_q10_gpu_email-enron.txt          &>> $output
# python3 run.py --algorithm dynedge --dataset email-enron        --batch 40  --gpu -o p48_q40_gpu_email-enron.txt          &>> $output
# python3 run.py --algorithm dynedge --dataset email-enron        --batch 100 --gpu -o p48_q100_gpu_email-enron.txt         &>> $output
# python3 run.py --algorithm dynedge --dataset facebook           --batch 1   --gpu -o p48_q1_gpu_facebook.txt              &>> $output
# python3 run.py --algorithm dynedge --dataset facebook           --batch 10  --gpu -o p48_q10_gpu_facebook.txt             &>> $output
# python3 run.py --algorithm dynedge --dataset facebook           --batch 40  --gpu -o p48_q40_gpu_facebook.txt             &>> $output
# python3 run.py --algorithm dynedge --dataset facebook           --batch 100 --gpu -o p48_q100_gpu_facebook.txt            &>> $output
# python3 run.py --algorithm dynedge --dataset hi2010             --batch 1   --gpu -o p48_q1_gpu_hi2010.txt                &>> $output
# python3 run.py --algorithm dynedge --dataset hi2010             --batch 10  --gpu -o p48_q10_gpu_hi2010.txt               &>> $output
# python3 run.py --algorithm dynedge --dataset hi2010             --batch 40  --gpu -o p48_q40_gpu_hi2010.txt               &>> $output
# python3 run.py --algorithm dynedge --dataset hi2010             --batch 100 --gpu -o p48_q100_gpu_hi2010.txt              &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella24     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella24.txt        &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella24     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella24.txt       &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella24     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella24.txt       &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella24     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella24.txt      &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella25     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella25.txt        &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella25     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella25.txt       &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella25     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella25.txt       &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella25     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella25.txt      &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella30     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella30.txt        &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella30     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella30.txt       &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella30     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella30.txt       &>> $output
# python3 run.py --algorithm dynedge --dataset p2p-Gnutella30     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella30.txt      &>> $output
# python3 run.py --algorithm dynedge --dataset PGPgiantcompo      --batch 1   --gpu -o p48_q1_gpu_PGPgiantcompo.txt         &>> $output
# python3 run.py --algorithm dynedge --dataset PGPgiantcompo      --batch 10  --gpu -o p48_q10_gpu_PGPgiantcompo.txt        &>> $output
# python3 run.py --algorithm dynedge --dataset PGPgiantcompo      --batch 40  --gpu -o p48_q40_gpu_PGPgiantcompo.txt        &>> $output
# python3 run.py --algorithm dynedge --dataset PGPgiantcompo      --batch 100 --gpu -o p48_q100_gpu_PGPgiantcompo.txt       &>> $output
# python3 run.py --algorithm dynedge --dataset slashdot           --batch 1   --gpu -o p48_q1_gpu_slashdot.txt              &>> $output
# python3 run.py --algorithm dynedge --dataset slashdot           --batch 10  --gpu -o p48_q10_gpu_slashdot.txt             &>> $output
# python3 run.py --algorithm dynedge --dataset slashdot           --batch 40  --gpu -o p48_q40_gpu_slashdot.txt             &>> $output
# python3 run.py --algorithm dynedge --dataset slashdot           --batch 100 --gpu -o p48_q100_gpu_slashdot.txt            &>> $output
# python3 run.py --algorithm dynedge --dataset web-indochina-2004 --batch 1   --gpu -o p48_q1_gpu_web-indochina-2004.txt    &>> $output
# python3 run.py --algorithm dynedge --dataset web-indochina-2004 --batch 10  --gpu -o p48_q10_gpu_web-indochina-2004.txt   &>> $output
# python3 run.py --algorithm dynedge --dataset web-indochina-2004 --batch 40  --gpu -o p48_q40_gpu_web-indochina-2004.txt   &>> $output
# python3 run.py --algorithm dynedge --dataset web-indochina-2004 --batch 100 --gpu -o p48_q100_gpu_web-indochina-2004.txt  &>> $output
# python3 run.py --algorithm dynedge --dataset web-standford      --batch 1   --gpu -o p48_q1_gpu_web-standford.txt         &>> $output
# python3 run.py --algorithm dynedge --dataset web-standford      --batch 10  --gpu -o p48_q10_gpu_web-standford.txt        &>> $output
# python3 run.py --algorithm dynedge --dataset web-standford      --batch 40  --gpu -o p48_q40_gpu_web-standford.txt        &>> $output
# python3 run.py --algorithm dynedge --dataset web-standford      --batch 100 --gpu -o p48_q100_gpu_web-standford.txt       &>> $output
# python3 run.py --algorithm dynedge --dataset web-webbase-2001   --batch 1   --gpu -o p48_q1_gpu_web-webbase-2001.txt      &>> $output
# python3 run.py --algorithm dynedge --dataset web-webbase-2001   --batch 10  --gpu -o p48_q10_gpu_web-webbase-2001.txt     &>> $output
# python3 run.py --algorithm dynedge --dataset web-webbase-2001   --batch 40  --gpu -o p48_q40_gpu_web-webbase-2001.txt     &>> $output
# python3 run.py --algorithm dynedge --dataset web-webbase-2001   --batch 100 --gpu -o p48_q100_gpu_web-webbase-2001.txt    &>> $output
# python3 run.py --algorithm dynedge --dataset wikiVote           --batch 1   --gpu -o p48_q1_gpu_wikiVote.txt              &>> $output
# python3 run.py --algorithm dynedge --dataset wikiVote           --batch 10  --gpu -o p48_q10_gpu_wikiVote.txt             &>> $output
# python3 run.py --algorithm dynedge --dataset wikiVote           --batch 40  --gpu -o p48_q40_gpu_wikiVote.txt             &>> $output
# python3 run.py --algorithm dynedge --dataset wikiVote           --batch 100 --gpu -o p48_q100_gpu_wikiVote.txt            &>> $output

# output=p48_gpu_statedge.txt  
# python3 run.py --algorithm statedge --dataset brightkite         --batch 1   --gpu -o p48_q1_gpu_brightkite.txt            &>> $output
# python3 run.py --algorithm statedge --dataset brightkite         --batch 10  --gpu -o p48_q10_gpu_brightkite.txt           &>> $output
# python3 run.py --algorithm statedge --dataset brightkite         --batch 40  --gpu -o p48_q40_gpu_brightkite.txt           &>> $output
# python3 run.py --algorithm statedge --dataset brightkite         --batch 100 --gpu -o p48_q100_gpu_brightkite.txt          &>> $output
# python3 run.py --algorithm statedge --dataset email-enron        --batch 1   --gpu -o p48_q1_gpu_email-enron.txt           &>> $output
# python3 run.py --algorithm statedge --dataset email-enron        --batch 10  --gpu -o p48_q10_gpu_email-enron.txt          &>> $output
# python3 run.py --algorithm statedge --dataset email-enron        --batch 40  --gpu -o p48_q40_gpu_email-enron.txt          &>> $output
# python3 run.py --algorithm statedge --dataset email-enron        --batch 100 --gpu -o p48_q100_gpu_email-enron.txt         &>> $output
# python3 run.py --algorithm statedge --dataset facebook           --batch 1   --gpu -o p48_q1_gpu_facebook.txt              &>> $output
# python3 run.py --algorithm statedge --dataset facebook           --batch 10  --gpu -o p48_q10_gpu_facebook.txt             &>> $output
# python3 run.py --algorithm statedge --dataset facebook           --batch 40  --gpu -o p48_q40_gpu_facebook.txt             &>> $output
# python3 run.py --algorithm statedge --dataset facebook           --batch 100 --gpu -o p48_q100_gpu_facebook.txt            &>> $output
# python3 run.py --algorithm statedge --dataset hi2010             --batch 1   --gpu -o p48_q1_gpu_hi2010.txt                &>> $output
# python3 run.py --algorithm statedge --dataset hi2010             --batch 10  --gpu -o p48_q10_gpu_hi2010.txt               &>> $output
# python3 run.py --algorithm statedge --dataset hi2010             --batch 40  --gpu -o p48_q40_gpu_hi2010.txt               &>> $output
# python3 run.py --algorithm statedge --dataset hi2010             --batch 100 --gpu -o p48_q100_gpu_hi2010.txt              &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella24     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella24.txt        &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella24     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella24.txt       &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella24     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella24.txt       &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella24     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella24.txt      &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella25     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella25.txt        &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella25     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella25.txt       &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella25     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella25.txt       &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella25     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella25.txt      &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella30     --batch 1   --gpu -o p48_q1_gpu_p2p-Gnutella30.txt        &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella30     --batch 10  --gpu -o p48_q10_gpu_p2p-Gnutella30.txt       &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella30     --batch 40  --gpu -o p48_q40_gpu_p2p-Gnutella30.txt       &>> $output
# python3 run.py --algorithm statedge --dataset p2p-Gnutella30     --batch 100 --gpu -o p48_q100_gpu_p2p-Gnutella30.txt      &>> $output
# python3 run.py --algorithm statedge --dataset PGPgiantcompo      --batch 1   --gpu -o p48_q1_gpu_PGPgiantcompo.txt         &>> $output
# python3 run.py --algorithm statedge --dataset PGPgiantcompo      --batch 10  --gpu -o p48_q10_gpu_PGPgiantcompo.txt        &>> $output
# python3 run.py --algorithm statedge --dataset PGPgiantcompo      --batch 40  --gpu -o p48_q40_gpu_PGPgiantcompo.txt        &>> $output
# python3 run.py --algorithm statedge --dataset PGPgiantcompo      --batch 100 --gpu -o p48_q100_gpu_PGPgiantcompo.txt       &>> $output
# python3 run.py --algorithm statedge --dataset slashdot           --batch 1   --gpu -o p48_q1_gpu_slashdot.txt              &>> $output
# python3 run.py --algorithm statedge --dataset slashdot           --batch 10  --gpu -o p48_q10_gpu_slashdot.txt             &>> $output
# python3 run.py --algorithm statedge --dataset slashdot           --batch 40  --gpu -o p48_q40_gpu_slashdot.txt             &>> $output
# python3 run.py --algorithm statedge --dataset slashdot           --batch 100 --gpu -o p48_q100_gpu_slashdot.txt            &>> $output
# python3 run.py --algorithm statedge --dataset web-indochina-2004 --batch 1   --gpu -o p48_q1_gpu_web-indochina-2004.txt    &>> $output
# python3 run.py --algorithm statedge --dataset web-indochina-2004 --batch 10  --gpu -o p48_q10_gpu_web-indochina-2004.txt   &>> $output
# python3 run.py --algorithm statedge --dataset web-indochina-2004 --batch 40  --gpu -o p48_q40_gpu_web-indochina-2004.txt   &>> $output
# python3 run.py --algorithm statedge --dataset web-indochina-2004 --batch 100 --gpu -o p48_q100_gpu_web-indochina-2004.txt  &>> $output
# python3 run.py --algorithm statedge --dataset web-standford      --batch 1   --gpu -o p48_q1_gpu_web-standford.txt         &>> $output
# python3 run.py --algorithm statedge --dataset web-standford      --batch 10  --gpu -o p48_q10_gpu_web-standford.txt        &>> $output
# python3 run.py --algorithm statedge --dataset web-standford      --batch 40  --gpu -o p48_q40_gpu_web-standford.txt        &>> $output
# python3 run.py --algorithm statedge --dataset web-standford      --batch 100 --gpu -o p48_q100_gpu_web-standford.txt       &>> $output
# python3 run.py --algorithm statedge --dataset web-webbase-2001   --batch 1   --gpu -o p48_q1_gpu_web-webbase-2001.txt      &>> $output
# python3 run.py --algorithm statedge --dataset web-webbase-2001   --batch 10  --gpu -o p48_q10_gpu_web-webbase-2001.txt     &>> $output
# python3 run.py --algorithm statedge --dataset web-webbase-2001   --batch 40  --gpu -o p48_q40_gpu_web-webbase-2001.txt     &>> $output
# python3 run.py --algorithm statedge --dataset web-webbase-2001   --batch 100 --gpu -o p48_q100_gpu_web-webbase-2001.txt    &>> $output
# python3 run.py --algorithm statedge --dataset wikiVote           --batch 1   --gpu -o p48_q1_gpu_wikiVote.txt              &>> $output
# python3 run.py --algorithm statedge --dataset wikiVote           --batch 10  --gpu -o p48_q10_gpu_wikiVote.txt             &>> $output
# python3 run.py --algorithm statedge --dataset wikiVote           --batch 40  --gpu -o p48_q40_gpu_wikiVote.txt             &>> $output
# python3 run.py --algorithm statedge --dataset wikiVote           --batch 100 --gpu -o p48_q100_gpu_wikiVote.txt            &>> $output
