
#set the environment PATH
export PYTHONNOUSERSITE=True
#module load singularity
BASE_DIR=$(pwd)


#Run the command
python3 alphafold/docker/run_docker.py \
 --fasta_paths=$BASE_DIR/$1 \
 --data_dir=/data_hdd/szym/data-2.3.1/ \
 --output_dir=$BASE_DIR/outputs \
 --model_preset=monomer \
 --db_preset=full_dbs \
 --docker_image_name=alphafold:2.3.1 \
 --max_template_date=2022-12-31 \
 --use_precomputed_msas=$2 \
