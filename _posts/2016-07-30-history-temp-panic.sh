ls /usr/local
rm siteconf.p
ls /usr/include/boost
ls /usr/include/
sudo apt install boost
sudo apt install python-boost
workon hope
pip3 install boost
pip3 search boost
exit
nvcc
nvcc --help
history | grep BLAS
exit
ls -al
cd src
ls -al
tar -xvzf boost_1_61_0.tar.gz 
cd boost_1_61_0/
ls -al
sudo apt install python3-dev
sudo apt install python3-devel
sudo apt install python-dev
history | grep BLAS
exit
history | grep BLAS
sudo apt search BLAS
sudo apt install libopenblas-*
cd src
ls -al
# sudo dpkg -i cuda-repo-ubuntu1504-7-5-local_7.5-18_amd64.deb 
sudo apt-get install linux-headers-$(uname -r)
sudo dpkg -i cuda-repo-ubuntu1504-7-5-local_7.5-18_amd64.deb 
sudo apt uninstall cuda
sudo apt-get  uninstall cuda
sudo apt-get remove cuda
ls /usr/local/
ls /usr/local/cuda
ls /usr/local/cuda/README 
more /usr/local/cuda/README 
more /usr/local/cuda/version.txt 
more /usr/local/cuda-7.5/version.txt 
sudo apt-get --purge remove cuda-7.5
ls /usr/local/cuda/README 
ls /usr/local/cuda/
ls /usr/local/cuda-7.5/
sudo dpkg -i cuda-repo-ubuntu1504-7-5-local_7.5-18_amd64.deb 
sudo apt-get update
sudo apt-get install cuda
sudo shutdown -r now
modprobe nvidia
more /etc/modules
sudo modprobe nvidia
sudo modprobe nvidia-uvm
ls /usr/local
nano /etc/bash.bashrc 
exit
nano .theanorc
workon hope
ipython
python3 -c 'import theano; theano.test()'
exit
update-alternatives g++
update-alternatives --list
update-alternatives --list g++
update-alternatives --list gcc
gcc -V
gcc -v
g++ -v
exit
htop
PW="`echo $UN | md5sum | cut -c2-7`"
UN=hannes
PW="`echo $UN | md5sum | cut -c2-7`"
echo $UN | md5sum | cut -c2-7
echo zak | md5sum | cut -c2-7
echo cole | md5sum | cut -c2-7
echo hannes | md5sum | cut -c2-7
exit
sudo apt-get install mpixx
mpixx
sudo apt-get install libopenmpi-dev
cd src
cd devops/
ls -al
cd scripts/
ls
nano addusers 
chmod +x addusers 
sudo ./addusers hannes cole matt erin andrew
sudo ./addusers riley
cd /usr/local/cuda-7.5/samples/
ls -al
cd bin
ls -al
cd x86_64/
ls
cd linux/
ls
cd release/
ls
cd ..
cd release
./deviceQuery
./bandwidthTest 
sudo apt install cuda-gdb-src
sudo apt search cuda-gdb-src
sudo apt-get install cuda-gdb-src
cd ~/src/
ls
sudo apt-get update
sudo apt-get install cuda-gdb
sudo apt-get install cuda-command-line-tools-7-5-src
sudo apt-get install cuda-command-line-tools-7-5-devel
sudo apt-get install cuda-command-line-tools-7-5-dev
echo -e "\n[nvcc]\nflags=-D_FORCE_INLINES\n" >> ~/.theanorc
workon hope
pip install Theano
pip uninstall Theano
pip remove Theano
pip purge Theano
pip cleanup
pip install Theano
python3 -c "import theano;"
python3 -c "import theano; theano.test()"
cd ../devops/
nano configure_theano
chmod +x configure_theano 
./configure_theano 
sudo apt install gcc-5.2
sudo apt install gcc-5.2.1
sudo apt install --update gcc
sudo apt install --upgrade gcc
which gcc
ls /usr/bin/gcc
/usr/bin/gcc
/usr/bin/gcc -v
python -c "import theano; theano.test()"
nano ~/.theanorc
python -c "import theano; theano.test()"
pip install git+https://github.com/dnouri/nolearn.git@master#egg=nolearn==0.7.git
pip install scipy
cd ..
cd devops/
ls
mv configure_theano scripts/
cd ..
sudo cp .theanorc ~hannes/
sudo su hannes
sudo chown hannes:hannes ~hannes/src/*
sudo chown hannes:hannes ~hannes/.theanorc 
sudo chown -R hannes:hannes ~hannes/src/
sudo su hannes
pip install lasagna
pip install Lasagna
pip install https://github.com/Lasagne/Lasagne/archive/master.zip
pip install --upgrade https://github.com/Lasagne/Lasagne/archive/master.zip
sudo pip install --upgrade https://github.com/Lasagne/Lasagne/archive/master.zip
deactivate
exit
cd src
cd devops/
ls
cd scripts/
ls
addusers thunder
sudo ./addusers thunder
more addusers
echo hannes | md5sum | cut -c2-7
echo thunder | md5sum | cut -c2-7
exit
ls
cd src
ls
tar -xvzf cudnn-7.5-linux-x64-v5.1-rc.tgz 
cd cuda
ls -al
export LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH
exit
env
env | grep LD
nano /etc/bash.bashrc 
nvcc -V
ls -al
cd src
ls -al
cd cuda
ls -al
cd ..
cd /usr/local
ls -al
cd cuda-7.5/
ls -al
cd samples
ls -al
make
gcc -V
gcc -v
sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo apt-get install gcc-4.9
sudo update-alternatives --remove-all g++
sudo apt-get install g++-4.9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 10
make
sudo make
cd ~/
workon hope
pip install -r https://raw.githubusercontent.com/dnouri/nolearn/master/requirements.txt
pip install git+https://github.com/dnouri/nolearn.git@master#egg=nolearn==0.7.git
ipython
pip freeze > requirements.gpu.txt
more requirements.gpu.txt 
nano requirements.gpu.txt 
cp requirements.gpu.txt ../../../hannes/
sudo cp requirements.gpu.txt ../../../hannes/
sudo chmod a+r ../../../hannes/requirements.gpu.txt 
sudo chmod a+w ../../../hannes/requirements.gpu.txt 
sudo chmod a+d ../../../hannes/requirements.gpu.txt 
sudo chmod a+x ../../../hannes/requirements.gpu.txt 
sudo su hannes
sudo pip3 install theano
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade theano
cd src
sudo su hannes
sudo pip3 install --upgrade https://github.com/Lasagne/Lasagne/archive/master.zip
sudo pip3 install --upgrade https://github.com/Theano/Theano/archive/master.zip
ls -al
cd devops
sudo nano test_theano_gpu.py
python3 test_theano_gpu.py 
cd ..
cd devops
mv test_theano_gpu.py scripts/
cd ..
mv cuda cuda_base
tar -xvzf cudnn-7.5-linux-x64-v5.1-rc.tgz 
ls -al
cd cuda
which nvcc
ls -al
sudo cp -P include/cudnn.h /usr/local/cuda-7.5/include
sudo cp -P lib64/libcudnn* /usr/local/cuda-7.5/lib/x86_64-linux-gnu/
sudo cp -P lib64/libcudnn* /usr/local/cuda-7.5/lib64/
sudo chmod a+r /usr/local/cuda-7.5/lib64/libcudnn*
cd /usr/local/cuda-7.5/
ls -al
cd ~/src/devops
ls -al
cd scripts/
git status
ls -al
sudo chmod +x test_theano_gpu.py 
./test_theano_gpu.py
sudo pip install twip
sudo pip install pug-nlp
workon hope
ls -al
cd hope
ls -al
cd hope
ls -al
cd ..
htop
w
sudo su hannes
python
ipython
write hannes "noticed that your env defaults to python2.7 mine is python 3.4.3 for all the root-install theano/nolearn stuff"
sensors
write hannes < `sensors` 
sensors | write hannes
write hannes "Nothing to worry about yet, but CPU is getting hot. Type `sensors` to see status"
write hannes "Nothing to worry about yet, but CPU is getting hot. Type 'sensors' to see status"
write hannes "I have $2 CPU cooler/radiator from free geek without any thermal paste, etc"
write hannes "So probably need to get a water-cooled radiator if you are going to run it continuously for long periods"
sensors
sensorsensor
sensors
htop
sensors