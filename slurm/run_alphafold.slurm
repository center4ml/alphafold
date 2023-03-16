#!/bin/bash
#SBATCH --job-name mon_2.3.1
#SBATCH --time=2-00:00:00   # or whatever fits the QoS, adjust this to match the walltime of your job
#SBATCH --cpus-per-task=8   # DO NOT INCREASE THIS AS ALPHAFOLD CANNOT TAKE ADVANTAGE OF MORE
#SBATCH --gres=gpu:1        # You need to request one GPU to be able to run AlphaFold properly
#SBATCH --mem=90G           # adjust this according to the memory requirement per node you need

###LOGGING
echo $1 >> outputs/$SLURM_JOB_ID.desc
cat $0 >> outputs/$SLURM_JOB_ID.desc

#set the environment PATH
export PYTHONNOUSERSITE=True
#module load singularity
ALPHAFOLD_DATA_PATH=/lu/tetyda/projects/center4ml/ProteinDatabases-2.3.1
ALPHAFOLD_MODELS=/lu/tetyda/projects/center4ml/ProteinDatabases-2.3.1/params
BASE_DIR=$(pwd)


#Run the command
singularity run --nv \
 -B $ALPHAFOLD_DATA_PATH:/data \
 -B $ALPHAFOLD_MODELS \
 -B $BASE_DIR/tmp:/tmp \
 --pwd  /app/alphafold /lu/tetyda/projects/center4ml/alphafold-2.3.1.sif \
 --fasta_paths=$BASE_DIR/$1 \
 --uniref90_database_path=/data/uniref90/uniref90.fasta \
 --data_dir=/data \
 --mgnify_database_path=/data/mgnify/mgy_clusters_2022_05.fa \
 --bfd_database_path=/data/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt \
 --pdb70_database_path=/data/pdb70/pdb70 \
 --uniref30_database_path=/data/uniref30/UniRef30_2021_03 \
 --template_mmcif_dir=/data/pdb_mmcif/mmcif_files \
 --obsolete_pdbs_path=/data/pdb_mmcif/obsolete.dat \
 --output_dir=$BASE_DIR/outputs \
 --use_gpu_relax=true \
 --model_preset=monomer \
 --db_preset=full_dbs \
 --max_template_date=2022-12-31 


