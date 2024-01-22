# vsd-hdp
  VLSI Hardware Development Program. This repository contains the entire flow from RTL design to GDSII
# Day 0
* Create the GitHub Repository
* Download and install VitualBox
* Download and install Ubuntu 22.04. The VM configured with 8GB RAM and 40GB storage.
     - Update and upgarde the Ubuntu to latest version of program.
       <pre> $ sudo apt-get update</pre>
       <pre>$ sudo apt-get upgrade</pre>   
* Install Git program <pre>$ sudo apt-get install git</pre>
* Install Yosys
  <pre>      $ git clone https://github.com/YosysHQ/yosys.git
        $ cd yosys
        $ sudo apt install make
        $ sudo apt-get install build-essential clang bison flex \
        libreadline-dev gawk tcl-dev libffi-dev git \
        graphviz xdot pkg-config python3 libboost-system-dev \
        libboost-python-dev libboost-filesystem-dev zlib1g-dev
        $ make config-gcc
        $ make
        $ sudo make install </pre>    
![Screenshot from 2024-01-21 15-33-16](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/2e457813-147f-4336-9099-6ef315d52c0c)
* Install iverilog  <pre> $ sudo apt-get install iverilog </pre>
  ![Screenshot from 2024-01-21 16-11-28](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/cd7afb20-3474-432b-b6bc-9f2d34d65cd9)
* Install GTKWave <pre>$ sudo apt-get install gtkwave </pre>
    ![Screenshot from 2024-01-21 16-25-06](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/5ba8c597-86ba-4da4-8415-700f1642a58d)
* Install Magic
<pre> $ sudo apt-get install magic --assume-yes
$ sudo wget "http://opencircuitdesign.com/magic/archive/magic-8.3.50.tgz"
$ tar -xvzf magic-8.3.50.tgz
$ cd magic-8.3.50
$ tar -xvzf magic-8.2.172.tgz
$ cd magic-8.2.172 </pre>
![Screenshot from 2024-01-21 16-58-27](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/247c43d6-6ccd-4cdb-a942-52052ff8364a)
* Install graywolf
<pre> $ git clone https://github.com/rubund/graywolf.git
$ cd graywolf/
$ mkdir build
$ cd build
$ cmake ..
$ sudo make
$ sudo make install </pre>
![Screenshot from 2024-01-21 17-12-36](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/44f61e92-140e-4a77-b946-afa0c0422da2)
* Install qrouter
<pre>$ tar -xvzf qrouter-1.4.59.tgz
$ cd qrouter-1.4.59
$ git clone git://opencircuitdesign.com/qrouter-1.4 
$ cd qrouter-1.4/
$ sudo ./configure
$ sudo make
$ sudo make install </pre>
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/ad761cd2-8abd-4bd3-85ac-6cd3c34ec8f7)
* Install OpenSTA
<pre>$ git clone https://github.com/abk-openroad/OpenSTA.git
$ cd OpenSTA/
$ sudo ./bootstrap 
$ sudo ./configure 
$ sudo make
$ git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
$ cd OpenSTA
$ mkdir build
$ cd build
$ cmake ..
$ make </pre>
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/4670fa6c-ec88-4719-8b0a-319f68073496)
* Install netgen
<pre>$ git clone git://opencircuitdesign.com/netgen-1.5 
$ cd netgen-1.5/
$ sudo ./configure
$ sudo make
$ sudo make install
$ cd ../
$ tar -xvzf netgen-1.5.134.tgz
$ cd netgen-1.5.134
$ git clone git://opencircuitdesign.com/netgen-1.5 
$ cd netgen-1.5/
$ sudo ./configure
$ sudo make
$ sudo make install</pre>
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/13e7881c-39f7-439f-9f49-8fe047b171b7)
* Install qflow
<pre>$ tar -xvzf qflow-1.3.17.tgz
$ cd qflow-1.3.17
$ git clone git://opencircuitdesign.com/qflow-1.3 
$ cd qflow-1.3/
$ sudo ./configure
$ sudo make
$ sudo make install</pre>
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/62a97dfb-f60c-425d-8955-c026a0ac623a)

# Day1
 <details>
 <summary> Introduction to Verilog RTL Design and Synthesis </summary>

 </details>
