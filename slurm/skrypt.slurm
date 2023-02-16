#!/bin/bash
#SBATCH --job-name move_res 
#SBATCH -A G89-1292            # your account or grant name (to be charged for the computations in HPC)
#SBATCH --time=1-00:00:00   # or whatever fits the QoS, adjust this to match the walltime of your job
#SBATCH --cpus-per-task=1   # DO NOT INCREASE THIS AS ALPHAFOLD CANNOT TAKE ADVANTAGE OF MORE
#SBATCH --mem=90G           # adjust this according to the memory requirement per node you need


BASE_DIR=$(pwd)


#Run the command
singularity exec --nv \
--bind $BASE_DIR:/scratch --pwd /scratch \
~/akalinow.simg  python3 ~/Process_alphafold/process_alphafold.py \
 --name_file_txt test.list --msas no --pkl no \
 --id_folder $1 \
 &> wyn.txt



