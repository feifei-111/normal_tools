ENV_PATH=$1
SETUP_PATH=$PWD

mkdir download && cd download
wget https://docs.anaconda.com/miniconda/#miniconda-latest-installer-links
wget https://developer.nvidia.com/nsight-systems/get-started#Linuxx86  # can nsys be installed only with one command line?
cd ..

cd $ENV_PATH
bash $SETUP_PATH/download/Miniconda3-latest-Linux-x86_64.sh -b -u -p ./
$ENV_PATH/miniconda3/bin/conda init
mkdir $ENV_PATH/mylocal && cd $ENV_PATH/mylocal && mkdir bin
echo "export PATH=$ENV_PATH/bin:$PATH" >> $SETUP_PATH/bashrc_settings.sh

cd $SETUP_PATH
cp -r bash_setup_scripts ~
cat bashrc_settings.sh >> ~/.bashrc

source ~/.bashrc