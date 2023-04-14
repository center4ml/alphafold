docker exec -it $1 \
python3 /af/process_alphafold.py \
 --name_file_txt plik_list --msas no --pkl no \
 --id_folder $2 \
 &> wyn.txt



