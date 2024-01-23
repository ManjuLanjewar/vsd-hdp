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
 ### Introduction to Verilog RTL Design and Synthesis

 <details>
   <summary>1.SKY130RTLD1SK1 - Introduction to Opensource Simulator iVerilog</summary>
                  <summary> -Introduction to iverilog design test bench</summary>
- RTL design is implementation of Specifications. Intend of spec need to be verified by simulating design. RTL design is checked for adherence to the spec by simulating design 
-Simulator is tool used for simulating the design. iverilog is simulator.
-Design is the actual verilog code or set of verilog codes/files which has the intended functionality to meet with the required specifications.
-To check weather design obeying required specifications or not, apply stimulus to design and observe it's ouput and match it to spec.
 So,Testbench is the setup to apply stimulus(test_vector) to the design to check its functionality. 

-Simulator looks for changes on the input signals and evaluating the output. If there is no change in the input, tere is no change in output. Simulator is looking for change in values of input. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/710a2e7d-6660-4d2a-b3ba-4fc721ae8cf3)

Design under testbench have set of primary inputs or one (in case of inverter) and 1 or more primary outputs. To all Primary inputs need to generate stimulus using Stimulus generator and from all primary output, observe stimulus in stimlus observer. Design is instantiated in testbench. 
TB doesn't have primary inputs or primary outputs.  

Simulation flow in iverilog simulator:  
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/e8b30f3e-1550-4cc7-abcf-246689bdffc7)

Design and testbench applied to iverilog. Any simulator look only for changes in input and going to dump changes in output.
Output of simulator is vcd file where vcd stands for value change dump because looking for changes in values. So, format is called vcd format.
To view vcd file, gtkwave tool is used for viewing waveforms and see waveform output. For given inputs, what is change in outputs.
So, functionality of design is verified from waveforms.
  
   2.SKY130RTLD1SK2 - Labs using iVerilog and gtkwaveg
   - In this enviornment setup is done for running lab. First tool flow setup and then file setup for running the labs
i)Clone the below repo as it contains library files and verilog files. 
  Library files contains verilog model and SKY130 standard cell library which will be used for synthesis. 
  verilog_model contains all standard cell verilog models of standard cells which are present in library files.
  Verilog_files contains source file and its corresponding testbench files.
                
   <pre>$ git clone https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git</pre>
       

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/c08e0b6b-6ccf-4aa6-9f3e-eb3ddbd9d130)

ii)Design files which are present in verilog_file folder will be loaded in iverilog. After loading design file, iverilog create output file              (a.out) 
<pre>$ iverilog good_mux.v tb_good_mux.v</pre>

      
iii)Execute the a.out file to generate the VCD info as a .vcd file(output of Simulator):
      
<pre>$ ./a.out</pre>
           
iv).vcd file is loaded in gtkwave simulator

<pre>$ gtkwave tb_good_mux.vcd</pre>
        

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/8bcee619-6741-4493-9a84-20f1d0a8e56e)

uut i.e. unit under test is under testbench. Drag and drop inputs and output to signal window and zoom fit to view the waveforms. To zoom on particular region on waveforms  click on that region and Zoom In to it. To see transition on signal , select signal and click on 'Zoom to End' and then click on 'Find Next Edge' to see forward transitions and 'Find Previous Edge' to see backward transitions. This is useful for evaluating designs.

v)To see file structure of design file and testbench file in gvim which is vim text editor with its own GUI.
<pre>$ gvim tb_good_mux.v -o good_mux.v</pre>
In testbench, Testbench instantiate design. Testbench doesn't have primary inputs or primary outputs. Design is instantiated in testbench and called design instantiated as uut or dut (design under test). In this testbench, there is no stimuls observer. Instead, directly Dumping vcd files. stimulus is generated. oserving output in gtkwave. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/c397a7e9-a8d3-4173-9e67-98679d106305)

3) Introduction to Yosys and Logic Synthesis
   * Yosys is synthesizer tool used or converting RTL to netlist.
   
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/6ae20ed1-6b19-4e65-b03b-96ac310a4837)

Setup shows, read_verilog command to read design.  read_liberty command to read .lib.  write_verilog command to write out netlist file. Execute write_verilog, to get netlist output.Netlist is represantation of the design in the form of standard cells present in the .lib. 
So, Design and netlist should be one and the same.

Verify the Synthesis
How to verify synthesis is correct or how to verify how tool has not messed up with design or done any intentionly to damage design while synthesis.
Need to verify synthesis output as well.
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/6c6bacc8-8a82-4e25-8808-bd743c2fd94f)

Here, to verify the synthesis netlist file and testbench file is given as  input to simulator tool iverilog to get vcd output. Load the waveform in gtkwave tool to observe stimulus. This stimulus should be same as output observed during RTL simulation. 
Netlist is true representation of my design that means the design was written as behavioral verilog code, my netlist is verilog code in terms of standard cells but betwwen my design and my synthesize netlist, my design is form of RTL code and design in form of netlist, primary input and outputs have not changed, should remains same. Use same testbench as RTL testbench. No need of new TB.   








