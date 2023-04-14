

BASE_DIR=$(pwd)


docker run --rm -it -d -p 8000:8000 --user $(id -u ${USER}):$(id -g ${USER}) -v $BASE_DIR:/scratch -v ~/Process_alphafold:/af -w /scratch \
akalinow/tensorflow-gpu:latest 
 



