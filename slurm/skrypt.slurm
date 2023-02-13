#!/bin/bash
#SBATCH --job-name move_res 
#SBATCH -A xxxxxxx            # your account or grant name (to be charged for the computations in HPC)
#SBATCH --time=1-00:00:00   # or whatever fits the QoS, adjust this to match the walltime of your job
#SBATCH --cpus-per-task=1   # DO NOT INCREASE THIS AS ALPHAFOLD CANNOT TAKE ADVANTAGE OF MORE
#SBATCH --mem=90G           # adjust this according to the memory requirement per node you need


BASE_DIR=$(pwd)


#Run the command
singularity exec --nv \
--bind $BASE_DIR:/scratch --pwd /scratch \
~/akalinow.simg  python3 ~/skrypt/process_alphafold.py \
 --name_file_txt plik.list --msas no \
 --id_folder $1 \
 &> wyn.txt



