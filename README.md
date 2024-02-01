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
Netlist is true representation of design that means the design was written as behavioral verilog code, netlist is verilog code in terms of standard cells but between design and synthesize netlist, design is form of RTL code and design in form of netlist, primary input and outputs have not changed, should remains same. Use same testbench as RTL testbench. No need of new TB.    
(This means that the netlist and the RTL are simply two representations of the design. The netlist representing rhe design in terms of standard cells and the RTL in terms of behavior.)

Logic Synthesis: 
RTL design is behavioural repesentation of required specifications written in behavioural form in verilog HDL. 
To get hardware digital design circuit how to map RTL code and digital design circuit. Synthesis means RTL to gate level translation. Design is converted into gates and connections are made between gates and file that is written out called as netlist. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/9dff0597-764b-42f1-a645-e98d117dc01b)

Logic Synthesis comes to resolve the problem of translating RTL code to Digital Logic Circuit form (Gate level translation + connecyions between the gates) by giving out the netlist file.

.lib is a collection of logical modules includes all basic gates like AND, OR, NOT, etc.( bucket of all standard cells availabale), as well as different flavors of same gates and their functionalities (slow, medium and fast versions/ 2, 3, 4 input versions). 
.lib is just collection of all standard cell, different flavours of same standard cell , different flavours of functionalities of same standard cell 
.lib contain std cells to implement any boolean logic functionalities. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/2c96a561-bca1-445e-a632-0bf1616b04ee)

Why different flavours of Gate requied. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/73a8d382-79d4-41b5-bb18-1726da58f40a)

F/F A and F/F B connected through combinational circuit. What is maximum speed of combinational circuit work? what is max clock rate can be applied to this? Tclk is period of clock. Tclk should be such big that time for data to travel from F/F A to F/F B, this should be achieved in 1 clk cycle. Tcq_A is Propogation ddelay of F/F A. Tcombi is propogation delay of combinational circuit. Set up time (Tsetup_B) is time before clock edge need to supply data at input of F/F B. Before clock arrives, data needs to be stable a small duration before. That small duration is called set up time.   
Tclk > Tcq_A + Tcombi + Tsetup_B. This is minimum requirement of clock period and that will decide maximum frequency, Fclk(max) will be 1/ Tclk(min).
To achive maximum clock speed, because min clock period, maximum will be clk speed so better is performance. Always looking for max performance, these delays (i.e. Tcq_A, Tcombi, Tsetup) should be as less as possible. so need cell to work very fast to make Tcombi small. So, are faster cells sufficient? 
should have faster cells in .lib? why do have slow and medium cells in .lib? 

Why do you need slow Cells?

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/4591b824-c92a-4ccb-b38f-a393fa0e0389)

F/F A is launching and F/F B to capture after F/F A i.e in next clk. Whatever F/F A is launching in previous cycle, it should be captured by F/F B in next clock cycle. If F/F B captures when F/F A is launching in previous cycle then there will be mismatch what F/F A launch in previous cycle. Missing some data. Need to guarantee minimum delay, that is delay from F/F A to F/F B should be greater than hold time.
Hold time of F/F is time after edge of clock, data should not change. Fastest change that can happen, the input of B should be after certain some time. so that F/F B reliablly catpture previous data. To ensure that there are no hold issues at F/F B, we need cells to work slowly. No need of fast cells.
, if start using fast cells, violating hold. because what my A is trying give out , may appear at. 
Cicuit should work fast but not ultra fast. Cicuit should be optimally fast. Need some cells to work slowly to meet hold time. Need some cells fast to meet setup. Need variety of cells to meet this requirement and this collection is present in .lib

Faster cells Vs Slower Cells
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/e08806b5-e2f4-412f-a123-f59a5b123441)

LOAD in Digital Logic Circuit is the capacitance. Faster is charging and discharging of capacitance, lesser is cell delay. charge capacitance at fast, propogation delay is less.  

Selection of Cells

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/f77dcd03-7ef0-464e-8e96-4d15b4dc7885)


Synthesis

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/9101ebec-983b-4be1-afd2-d5f21a71e70e)


 4) Labs using Yosys and Sky130 PDKs 

Invoke Yosys
<pre>yosys</pre>

Once inside yosys, read_liberty command can be used to read libraries:
<pre>read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>

read the design (verilog file)
 <pre> read_verilog good_mux.v</pre>
After executing read command, "Successfully finished Verilog frontend",this statement should be printed, means verilog file is read successfully.
  
To synthesize the design, specify the module to use (good_mux):
<pre>synth -top good_mux</pre>
synth -top specify what is module going to be synthesize. 

To generate the netlist:
<pre>abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib </pre>
abc command  convert RTL file into Gates and what gates it has to link to is specified in library....logic of good_mux will be realized in terms of standard cells available in library sky130_fd_sc_hd__tt_025C_1v80.lib

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/de53476e-f337-46b3-97b9-9608848b7224)

Note that it has inferred what all cells (i.e.3 input signals, 1 output signal, internal signals 0) as shown above. 

To view the logic it realized in graphical form, write show inside yosys:

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/26778c08-5aad-4b43-9129-a8a2243803a5)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/0541654a-4d30-4776-ac0c-f671a27ce890)

Mux is realized completely in library sky130_fd_sc_hd__tt_025C_1v80.lib which is used.

How to write netlist

The commands to write the netlist is write_verilog
<pre>write_verilog good_mux_netlist.v</pre>
<pre>!gvim good_mux_netlist.v</pre>
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/757a78fa-cdfd-4827-abec-c90f2fcad3c4)

It has dump out so many extra information. 

There is more switch to use to get netlist in simple way. 
<pre>write_verilog -noattr good_mux_netlist.v</pre>
<pre>!gvim good_mux_netlist.v</pre>
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/de2a6edb-7ae9-4469-a780-194d50c754da)

here,instantiation of MUX is created. given some name to instantiation (Here, sky130_fd_sc_hd_mux2_1_4_)
some internal nets or wires are created (like, wire_0_, wire_1_ etc.)to make connection (This explanation os simplified netlist should be understand from kunal)

Top module of netlist is same module what we synthesize i.e.good_mux module 

## Day 2
I] Introduction to library files 
| Timing libs, hierarchical vs flat synthesis and efficient flop coding styles

1) Introduction to .libs

 What exactly .lib looks like and what it contains? Libraries present in sky130_fd_sc_hd__tt_025C_1v80.lib
<pre>$ gvim ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/939b38f5-0a8d-4009-b285-1b562f74c645)


After opening libraru file in gvim, to have plesant colour, use command :syn off

First understaning name of library. 
Name of library "sky130_fd_sc_hd__tt_025C_1v80". Here, 130nm library, "tt" stands for typical. libratry can be slow, fast or typical. 025C is temperature. 
When looked into library, three words come into picture i.e. P V T where P stands for Process, V stands for Voltage, T stands for temperature. 
These 3 are very important for design to work. There will be variation in process due to fabrication. Variation due to voltage because when vary voltage there will be variation in behaviour of circuit. Semiconductors are very sensitive to temperature. These these three together will determine how my silicon is going to work faster or slower. When silicon to work, it should work all the corner. If any of parameter varies Process/ Voltage /temperature, still silicon should work
Ex. CD player sold in different parts of world and it should work in country like Dubai where temp high, India where temp varies whole yea and in  country like Swiss, temp less than 20C and somtimes 0C. Across all places, all time, CD player circuit should wotk. 
So, we need to factor in theses variation while designing circuit. So, libraries will be charactrised to model theses variations. These P, V, T is indicated in first line of library name i.e 'tt' indicates process, 025C indicates temperature and 1v80 indicates Voltage. 
Then, .lib will give information about technology used(CMOS), delay model (lookup table) used, and then units of time is specified in (ns), voltage (V), resistance (kohm), power(nW), capacitance(pf), current(mA) and operating condition (P, V, T).

.lib contains lot of all standrad cells with different flavours of different cells, different flavours of same cells. 
.lib contains different features of cell, it will tell leakage power for all input condition. 
For Example 
cell ("sky130_fd_sc_hd__a2111o_1") {
        leakage_power () {
            value : 0.0017945000;
            when : "!A1&!A2&!B1&!C1&D1";
        }

a2111o means it is AND-OR gate,and it's 2-input AND gate , remaining are OR Gate. It is havinf so many inputs "!A1&!A2&!B1&!C1&D1 (A1 and A2 are AND and OR it with B1, C1 and D1. So total 5 inputs, means total 32 possible input combinations. For all 32 input combination, what is delay, power  that information is present.
Here, !A1&!A2&!B1&!C1&D1 means A1, A2, B1 and C1 are all low and D1 high , at that time what is power the cell is consuming so such 32 combinations of input is present in library with value of (0.0017945000) leakge power is mentioned. area number, power port information, describe each input pin i.e. input capacitance of pin, power related to pin, tansition, delay assosciated with each input pin. Then, it gives power and timimg information of GATEs with all possible input conditions. 
![Screenshot from 2024-01-24 15-18-22](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/e618969b-32e1-4562-819c-074f58c5cbc2)

Here, for 2 inputs AND gates with different flavours like _and_2_0, Area is 6.256,for _and_2_2, Area is 7.507 and for _and_2_4, Area is 8.758.
_and_2_4, this is Larger cell than other two but all are _and_2 cell. Larger Cell means this cell employing wider transistors. Wider cell will be faster, but area is more so power is more, delay is less. Smaller cell, delay more,area will be less and power is less.

II] Hierarchical vs Flat Synthesis and how netlist looks about
Here, how the Yosys tool performs the synthesis and generates the netlst for a multi-module design with and without preserving the design hierarchy.
For this use the design file, multiple_modules.v, which contains some logic implementation using two sub-modules.

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/2577909c-9d15-4788-86ba-f8b2fbae1b08)

It has 2 sub modules, sub_module1 is an AND gate, sub_module2 is OR Gate and module called multiple module instantiate sub_module1 and sub_module2.

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/5e65e523-1f20-494e-8c20-f49955143c03)

This is how design looks. Here, multiple_module where sub_module1 which is AND Gate instantiated as u1 and sub_module2 which is OR Gate is instantiated as u2. multiple_module has 3 inputs a,b,c and 1 output y.
When synthesize, how it make differnce and why it should make difference?
First launch yosys
<pre><font color="#12488B"><b>~/vsdflow/VLSI/sky130RTLDesignAndSynthesisWorkshop/verilog_files</b></font>$ yosys</pre>
Read liberty file 
<pre>yosys&gt; <pre>yosys&gt; read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre></pre>
Read Verilog 
<pre>yosys&gt; read_verilog multiple_modules.v</pre>
<pre>yosys&gt; synth -top multiple_modules</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/5d0542db-9ead-4732-b2be-cde61d8bf172)

It shows report.

<pre>yosys&gt; abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib </pre>

<pre>yosys&gt; show multiple_modules</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/a6b87fcd-be39-4e44-9d6e-0e72d014e59c)

Here, it shows top module. Not showing AND Gate or OR Gate. It is showing u1 and u2 which are instance of sub_module1 and sub_module1.
Ideally it is expected to see AND Gate or OR Gate. This is called Hierarchical design. Here,the hierarchies are preserved:

<pre>yosys&gt; write_verilog -noattr multiple_modules_hier.v</pre>

<pre>yosys&gt; !gvim multiple_modules_hier.v</pre>

Netlist for multiple module is as follow: 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/e8e4069b-f8e1-4c83-8f9a-6dda95fb1065)

multiple_module has inputs a,b,c and output y and instantitaion of sub-module 1 which is u1 and sub-module 2 which is u2.
sub-module 1 is separate module inferring AND Gate and  sub-module 2 is separate module inferring OR Gate but here instead of OR Gate, NAND Gate is inferred.
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/76f60307-a013-46c5-aefc-5384fe1b732a)

Here, 2 inverters output is given as input to NAND Gate. As per DeMorgans theorem, NAND Gate is nothing but input inverted OR Gate. so replace NAND Gate with input inverted OR Gate. These invertes are back to back which are cancel out and a and b forms y. OR Gate is expected but sub-module 2 inferred NAND Gate. Why do synthesis do this? (Exercise: Look into .lib and find out)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/ebb75191-a0bf-414a-b831-e5bd3d9a5ee4)

CMOS NAND implementation is choosen. In NAND, NMoS is stacked. In case, to realize NOR, in CMOS, OR cannot be implemented. CMOS always implements inverting function. So, Use NOR, followed by inverter to get OR. It will have stacked PMoS followed by inverter to get OR Gate. Stacking PMoS is always bad.Because PMoS has poor mobility and to improve, make wide cells which requires good logical efforts. (Exercice: Read about This)

Flattened
To flatten the hierarchical design, the command flatten is used to write the flatten netlist.
<pre>yosys&gt; flatten</pre>
<pre>yosys&gt; write_verilog multiple_modules_flat.v</pre>
<pre>yosys&gt; write_verilog -noattr multiple_modules_flat.v</pre>
<pre>yosys&gt; !gvim multiple_modules_flat.v</pre>

Netlist is shown in gvim. To see both Hierarchial and Flattend netlist simultaneously, write command in gvim as (:vsp multiple_modules_hier.v)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/29120127-b914-44cf-bbb9-820bd8eaf4f3)

In Hierarchial design, hierarchies of sub-module 1 and sub-module 2 are preserved.
In Flattened design, single netlist, hierarchies are flattened out. Instantiation of AND Gate and OR Gate directly under multiple_module.  
This is difference of using flatten switch vs not using flatten switch.

<pre>yosys&gt; read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; read_verilog multiple_modules.v</pre>
<pre>yosys&gt; synth -top multiple_modules</pre>
<pre>yosys&gt; abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; flatten</pre>
<pre>yosys&gt; show</pre>
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/28a3047a-8ddc-44d3-aa6c-7dfc91735cc5)

Here, no u1 and u2 as it is flattened.  AND Gate, Inverter feeding NAND Gate (i.e. OR Gate). Output of u1 feeding u2 with another input coming from c. 
This how multiple_module looks in flattended design, complete structure is seen. 

The submodule synthesis (instead of top level as above) goes like this:
<pre>yosys&gt; read_liberty -lib  ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; read_verilog multiple_modules.v</pre>

To synthesize at u1 or u2 level and not at multiple_module level: 

<pre>yosys&gt; synth -top sub_module1</pre>

<pre>yosys&gt; abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib </pre>

<pre>yosys&gt; show</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/c928dc79-fc22-4beb-9181-51332cefa51f)

Here seen only sub_module1 i.e. AND Gate. Why sub_module level synthesize is done? 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/f8e5fcbf-47bc-4881-bcb6-6228b6ff7d7f)


This is your top module and this is multiple instantiation of same component. let's say we have design called multiplier and it is instantiated muliple times i.e. mult1, mult2, mult3, mult4, mult5, mult6...here 6 instantiation of multiplier. So instead of instantiation of multiplier 6 times, synthesize one time and replicate that netlist 6 times and stitched it together in top module. Module levele synthesize is preferred when we have multiple instances of same module. 
Divide and Conqure: Let's say your deign is very massive. When massive design is given to tool, tool is not doing good job. Instead of giving entire massive design to tool, giving one portion by one portion to tool. So that it writes optimised netlist and stitched all netlist together in top module.
These are two reason why sub_module level synthesize. In yosys tool, to control which module to synthesize by using keyword synth -top <module name>.


Various Flops Coding Styles and Optimization

Different types of flops, Different coding style. 
Why Flops? For any combinational circuit, when input is given, output is going to change after propogation delay. Due to this ouput is going to glitch. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/0d3b23fc-29ca-4c1a-87fd-de8ed67b3162)

Here,when c goes 0, y is 1.  initially a and b both are 0, internal node 'i' is 0. C is going from 1 to 0. So, y is '0'. 
y was intially 1 because c was 1. Let's say propogation delay of OR Gate as 1ns. After 1ns, c going low, y will go low. 
Delay of AND gate is 2ns. Now a and b goes high, after 2ns, Node i to go high. After i goes high, it will take propogation delay of OR Gate i.e. 1ns, output y to go high again. but momentarialy y goes low and then high. This is called glitch. 
For boolean expression (a&B)|c  for input condition a=b=0 and c=1, y=1 
                                                    a=b=1 and c=0, y=1     
For both input condition, y=1, but momentarialy 'y' goes low and then high. This is called glitch. 
In design, there are combinational circuit, more combinational circuit means more glitches. Output will continuously be glitchy. To avoid this, element required to store value. That element called flops which are like storage elements. In f/f are put in between combinational circuits, using f/f is sort of restrict glitches, way f/f works is, f/f output will change only on edge of clock, So giving clock to this f/f, output of f/f will change only on edge of clock. That means even though i/p of flop is glitching, o/p of f/f will be stable. Output of f/f is stable, this f/f is feeding to combinational circuits. This combinational circuits sees stable inputs, eventually combinational circuits output will also settle down. Otherwise, this glitches propogates through combinational circuits.Because of putting f/f, this is sort of shielding, this, D,and Q. The Q node is sort of shield from D node because of through clock, there is no connection between D and Q and there is no clock. If clock edge doesn't occur, Q doesn't change. 
So, Q is shielded from changes in D. Therefore, Q is always giving stable value that means output of combinational circuits will settled down. 
That ismain pupose of f/f using in digital circuits. There should be intitial state of f/f. If it is unknown, combinational circuit is looking to f/f to evaluate output. If f/f is not initialized, combinational circuits will evaluate into garbage value. To initialize f/f, we have control pins on f/f as SET or RESET. These pins cab be synchronous or asynchronous.

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/da0a9b61-11e7-4b2e-9e52-a1370ac9a981)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/a13de00c-b6f8-4bbd-b40a-b90f2524c799)

first circuit is f/f with asynchronous reset. This is code for f/f always at posedge clk signifies posedge f/f. Posedge of asynchronous reset (posedge async_reset). In verilog code,always block evaluated, if there is change in posedge clk or change in async_reset. Once enter always block, bacause of async_reset, q goes low. Instead of name async_reset, if  named as X,Y or Z, upon signal output is going low, then clearly it is async_reset. If it is not async_reset, then q=d due to posedge clk. If there is negedge then this always block will not evaluated. Upon posedge, q==d, so This is D f/f with asynchronus reset because it is not looking for any clock / wait for clk. Suppose you have clk, and apply asynchronus reset. Initially asynchronus reset is low, q may be 1 or 0, but q goes low once asynchronus reset goes high, it will not wait for posedge. asynchronus means irrespective of clock.

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/3af6e320-4179-422f-9398-ba23fb45cef9)

For asynchronus set, name signal as async_set.
always block gets evaluated upon posedge clk or async_set. Once enter always block because of async_set, q=1 that means without dependancy of clock. Hence called as asynchronus set. Else q==d. 
Now for synchronous set or synchronus reset, Whenever there is synchronus, will come in D pin of clock. This is f/f, with synchronous reset using MUX.
If reset is high then 1'b0 else load it with D. It is synchronous reset because it wait for clock. Suppose we have clock and synchronous reset, sync_reset going to pin D of f/f. So, 0 will be waiting at pin D and it will be awaiting posedge of clock. So on subsequent next rising edge, weather f/f was 0 or 1 here, it will go to 0. Clearly reset is waiting clock edge. So it is synchronous reset. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/82a039cb-f265-4cac-b7bb-264c512db174)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/f46ab3ee-b9e5-44e2-b8db-ec448149944f)

comparing asynchronous reset with synchronous reset code, in synchronous reset, only clk is present but in asynchronous reset, clk and async_reset both present. In synchronous reset, always block is evaluated only upon clk. Even if sync_reset going to toggle, always block not evaluated till there is posedge on clk.
Upon posedge on clk, if there is synchronous reset, q goes low else q follows D. This is behaviour of f/f with synchronous reset.
In some situations have both synchronous and asynchronous reset, there is not race condition but clearly we should have circuit to avoid race around condition in case of both set or reset.  

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/e6e00289-8f62-40b1-ae89-a80553fd7688)

In first code have both async_reset and sync_reset, always block is evaluated upon posedge clk and async_reset. If enter into always block due to async_reset, q goes low else (that means not because of async_reset), always block was entered due to posedge of clk. Upon clk, if there was sync_reset, q goes low else q ==d. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/c3f0fdc0-02bc-4898-80ec-25409713f477)

####D f/f with asynchronous reset

To see file structure of design file and testbench file in gvim 

<pre>$ gvim tb_dff_asyncres.v -o dff_asyncres.v </pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/73ad9a3d-ca14-4d79-8be2-ffc438febf80)

<pre>$ ls *dff*</pre>
<pre>$ iverilog dff_asyncres.v tb_dff_asyncres.v</pre>
<pre>$ ./a.out</pre>
<pre>$ gtkwave tb_dff_asyncres.vcd</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/356f8f39-19b9-4a86-8afd-b9c7075d5d91)

reset went low here and d was high, but  output of f/f, q is not immediaitely going high waiting for clkedge to become 1.  d is aligned with clk and q is generated so q is synchronous to clk, d may come at any time but q will change upon clk. 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/5b0b74b8-6fc7-40bf-88e6-6b10d055f6f8)

Here just before reset was coming, upon previous posedge, d==1, q become 1 but moment reset come, it was not waiting for subsequent clkedge, immediately q goes low. This asynchronous reset is not awaiting clkedge, immediately making q go low. 

Synthesis 

<pre>$ yosys</pre>
<pre>yosys&gt; read_verilog dff_asyncres.v</pre>
<pre>yosys&gt; synth -top dff_asyncres</pre>
<pre>yosys&gt; dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; show</pre>

NOTE : To synthesize flip-flops using Ysosys, we need to provide an additional command dfflibmap so as to map the internal flip-flop cells to the flip-flop cells in the technology library specified in the given liberty file.

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/e557a29c-a084-4903-ae62-c4102658011b)

Inverter is here , in code, f/f is written with active high reset but f/f having active low reset so tool inserted inverter here so reset bar bar is reset, so active high reset.

####D f/f with asynchronous set

To see file structure of design file and testbench file in gvim 

<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim dff_async_set.v -o tb_dff_async_set.v</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/79a8ae77-8522-41ae-88a5-ca171ccf5f6e)

<pre><font color="#12488B"><b>verilog_files</b></font>$ ls *dff*</pre>
<pre><font color="#12488B"><b>verilog_files</b></font>$ iverilog dff_async_set.v tb_dff_async_set.v</pre>
<pre><font color="#12488B"><b>verilog_files</b></font>$ ./a.out</pre>
<pre><font color="#12488B"><b>verilog_files</b></font>$ gtkwave tb_dff_async_set.vcd</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/d63a400c-4d52-4acd-a648-55cac9da57f5)

changes in d pin are felt on q pin only upon edge of clk. q stuck at 1 irrespective of d till async_set is high. 
Once async_set is low, q is looking for changes in d only upon edge of clk. Upon clock edge, d =1, q=1

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/92252267-ffd2-4e42-a870-ea047bbc9171)

Ireespective of clk, async_set is making q go 1 and is continuing to be 1 and not following clk and d , till  async_set is high.
when async_set is goes low, only then again with respect to posedge clk, q follows posedge of clk

Synthesis

<pre><font color="#12488B"><b>verilog_files</b></font>$ yosys</pre>
<pre>yosys&gt; read_verilog dff_async_set.v</pre>
<pre>yosys&gt; synth -top dff_async_set</pre>
<pre>yosys&gt; dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; show</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/5b96d5bb-523d-4bf0-9a2f-8da79b24ab10)

Here, async_set f/f. Library has f/f with active low SET but in code written as active high SET so tool is putting inverter on SET path. 

####D f/f with synchronous reset

To see file structure of design file and testbench file in gvim 

<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim tb_dff_syncres.v -o dff_syncres.v</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/36a666fe-0cb1-4055-95ac-a4b8123e079d)

<pre><font color="#12488B"><b>verilog_files</b></font>$ ls *dff*</pre>
<pre><font color="#12488B"><b>verilog_files</b></font>$ iverilog dff_syncres.v tb_dff_syncres.v</pre>
<pre><font color="#12488B"><b>verilog_files</b></font>$ ./a.out</pre>
<pre><font color="#12488B"><b>verilog_files</b></font>$ gtkwave tb_dff_syncres.vcd</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/88676ba2-56fe-419d-9756-2a03b6c0612f)

In previous ex, rest went high, irrespective of clk, q goes low. But here q is not going low, waiting for subsequent clkedge and then only going low.
Reset is applied on posedge of clk. 
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/6ce9e995-7b1b-43de-a386-0f827d78ef7f)

Here both reset as well as d is present and reset is taking high precedence and enforcing output to be zero. 
Once posedge of clk is entered, sync_reset has higher priority than d. 
If both clk as well as d are high on edge of clk , prefernce given to sync_reset because sync_reset is in if part and d is in else part in verilog code.

Synthesis

<pre><font color="#12488B"><b>verilog_files</b></font>$ yosys</pre>
<pre>yosys&gt; read_verilog dff_syncres.v</pre>
<pre>yosys&gt; synth -top dff_syncres</pre>
<pre>yosys&gt; dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; show</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/1e4d09eb-cf5c-4d10-b68d-064b994a966d)

There is no SET pin and RESET pin. In input D pin, Synch_reset with inverted input A_N and d

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/9cb98224-16f6-4828-91fd-11afa0541e64)

Some interesting synthesis optimizations involving multipliers

1. Multiplication by 2

<pre><font color="#12488B"><b>verilog_files</b></font>$ ls</pre>
<pre><font color="#12488B"><b>verilog_files</b></font>$ mult_*.v -o</pre>
<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim mult_*.v -o</pre>

Verilog Snippet

<pre>module mul2 (input [2:0] a, output [3:0] y);
	assign y = a * 2;
endmodule</pre>

Synthesis :

<pre><font color="#12488B"><b>verilog_files</b></font>$ yosys</pre>
<pre>yosys&gt; read_verilog mult_2.v</pre>
<pre>yosys&gt; read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; synth -top mul2</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/f4e8327d-5c93-4a2d-a106-1a2921d07632)

After execution synth -top, number of memories, memory bits, processes and cells are zero. So, there is no need of abc -liberty as there is nothing to map as there is no standard cells.

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/8f99c0e3-490c-4b7f-a4cc-8430d153b985)

So, here number a is appended with 1'b0.

Netlist generated by Yosys:

<pre><font color="#12488B"><b>verilog_files</b></font>$ yosys</pre>
<pre>yosys&gt; read_verilog mult_2.v</pre>
<pre>yosys&gt; abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; write_verilog -noattr mul2_net.v</pre>
<pre>yosys&gt; !gvim mul2_net.v</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/c94e98c4-8242-4db5-8a31-2871206f61f2)

Multiply a 3-bit number by 9

The input is a 3-bit binary number and the output is defined to be 9 * input.

Verilog Snippet

<pre>yosys&gt; read_verilog mult_8.v</pre>
<pre>yosys&gt; !gvim mult_8.v</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/4afdd552-e270-4b63-a5c0-5392bd3a6a70)


Synthesis :

<pre>yosys&gt; read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; read_verilog mult_8.v</pre>
<pre>synth -top mul8</pre>
<pre>yosys&gt; show</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/bb9877f0-3ce9-453b-97ac-37b51277bca4)

After execution synth -top, number of memories, memory bits, processes and cells are zero. So, there is no need of abc -liberty as there is nothing to map as there is no standard cells.

Netlist generated by Yosys:

<pre><font color="#12488B"><b>verilog_files</b></font>$ yosys</pre>
<pre>yosys&gt; read_verilog mult_8.v</pre>
<pre>yosys&gt; abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib</pre>
<pre>yosys&gt; write_verilog -noattr mul8_net.v</pre>
<pre>yosys&gt; !gvim mul8_net.v</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/70fe73f3-a5ab-4d12-85d9-d916a2e8ceea)


## Day 3 
Combinational and sequential optmizations

The combinational logic is simplified to the most optimized form which is efficient in terms of area & power savings.

## 1. Introduction to optimizations
   
Combinational logic optimisation bring power and area savings by squeezing the logic to get the most optimised design; Some techniques are Constant Propagation, which is a direct optimisation, and Boolean Logic Optimisation, like K-Map and Quine McKluskey done in the synthesis process.

1. Constant Propagation : This is a direct optimization method wherein the Boolean expression of the synthesized logic is simplified if any of the inputs are "a constant" and subsequently some of the logic gate outputs also propagate a constant value always.
   
3. Boolean Logic Optimization : The various Boolean expression optimization techniques like K-maps (graphical), Quine-McLusky, reduction to standard SOP/ POS forms best suited for the cell library/ technology etc.


### * Combinational logic optimization
   
Files used for lab are :
   
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/7ad9b833-c348-4530-87b9-ed952b165729)

#### Example 1: opt_check.v

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/8c872ab2-82ec-4ccb-8e85-03561fa8baba)

<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim opt_check.v</pre>

<pre>module opt_check (input a , input b , output y);
	assign y = a?b:0;
endmodule</pre>

#### Note

The command to perform logic optimization in Yosys is opt_clean before linking to liberty. 
Additionally, for a hierarchical design involving multiple sub-modules, the design must be flattened by running the flatten command 
before executing the opt_clean command.
After the synth -top <module_name> command is executed, do:
    <pre>opt_clean -purge</pre>
This command identifies wires and cells that are unused and removes them.
The additional switch, purge also removes the internal nets if they have a public name.

#### For combination logic optimization the general workflow for synthesis is: 

	$ yosys
	yosys> read_liberty -lib ../path_of_library_file/silicon_library.lib
	yosys> read_verilog design_top_file.v
	yosys> synth -top top_module_name
	yosys> opt_clean -purge
	yosys> abc -liberty ../path_of_library_file/silicon_library.lib
	yosys> show

#### Example showing the sequence of commands to perform combinational logic optimization using Yosys on module opt_check in opt_check.v:

        read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	read_verilog opt_check.v 
    	synth -top opt_check 
    	opt_clean -purge
    	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	show

#### Synthesis Result 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/1404d3dc-f8d9-41e5-b492-947a1f7e7b05)

#### Example 2: opt_check2.v

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/548834d3-8ebb-47cb-93be-4fc770c48a50)

####  Boolean simplification:
####     y = a + a_bar*b
####        = ab + a*b_bar + a_bar*b
####        = (ab + ab) + a*b_bar + a_bar*b
####        = (ab + a*b_bar) + (ab + a_bar*b)
####       = a + b 
####  i.e, a 2-input OR Gate. 

<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim opt_check2.v</pre>

<pre>module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule</pre>

#### Example showing the sequence of commands to perform combinational logic optimization using Yosys on module opt_check2 in opt_check2.v:

        read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	read_verilog opt_check2.v 
    	synth -top opt_check2 
    	opt_clean -purge
    	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	show
     
#### Synthesis Result 

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/ebf0d0e3-36ea-4eab-97f9-21cd1ce7c7ca)

OR gate involve NOR gate and NOR gate has stacked PMOS which is not good. So, it is a NAND-realization of the OR gate.


#### Example 3: opt_check3.v

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/7e1a4152-d000-4d26-aace-a2907ba34573)

3-input AND Gate

<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim opt_check3.v</pre>

<pre>module opt_check3 (input a , input b, input c , output y);
	assign y = a?(c?b:0):0;
endmodule</pre>

#### Example showing the sequence of commands to perform combinational logic optimization using Yosys on module opt_check3 in opt_check3.v:

        read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	read_verilog opt_check3.v 
    	synth -top opt_check3 
    	opt_clean -purge
    	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	show
     
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/9b8cb14e-8d7e-405c-a2c6-95f9ebf3454a)


#### Example 4: opt_check4.v

<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim opt_check4.v</pre>

<pre>module opt_check4 (input a , input b , input c , output y);
 assign y = a?(b?(a & c ):c):(!c);
 endmodule</pre>

#### Boolean simplification:
####      y = a*(abc + b_bar*c) + a_bar*c_bar
####        = abc + a*b_bar*c + a_bar*c_bar
####        = abc + a*b_bar*c + (a_bar*b*c_bar + a_bar*b_bar*c_bar)
####        = ac + a_bar*c_bar
####        = !(a^c)
#### i.e, a 2-input XNOR Gate.

#### Example showing the sequence of commands to perform combinational logic optimization using Yosys on module opt_check4 in opt_check4.v:

        read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	read_verilog opt_check4.v 
    	synth -top opt_check4
    	opt_clean -purge
    	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	show
     
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/b3b38fee-2bca-4e30-b8c8-9fe0d8fd34fa)

#### Example 5: multiple_module_opt.v

<pre><font color="#12488B"><b>verilog_files</b></font>$ ls multiple_module_opt*</pre>

<pre>module sub_module1(input a , input b , output y);
 assign y = a & b;
endmodule

module sub_module2(input a , input b , output y);
 assign y = a^b;
endmodule

module multiple_module_opt(input a , input b , input c , input d , output y);
wire n1,n2,n3;

sub_module1 U1 (.a(a) , .b(1'b1) , .y(n1));
sub_module2 U2 (.a(n1), .b(1'b0) , .y(n2));
sub_module2 U3 (.a(b), .b(d) , .y(n3));

assign y = c | (b & n1); 

endmodule</pre>

#### Example showing the sequence of commands to perform combinational logic optimization using Yosys on multiple_module_opt in multiple_module_opt.v:

For designes with submodules (must of designes) we should add special command for conversion of hierarhical design to flat. Because an optimizer can do optimization only inside one module. In this case our workflow extends to:

        read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	read_verilog multiple_module_opt.v 
    	synth -top multiple_module_opt
    	opt_clean -purge
    	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	show
        write_verilog -noattr multiple_module_opt_flat.v
	
	
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/515416a9-ee64-40db-a8e9-396a28b758d7)

#### Example 6: multiple_module_opt2.v

 <pre><font color="#12488B"><b>verilog_files</b></font>$ gvim multiple_module_opt2.v</pre>    

<pre>module sub_module(input a , input b , output y);
     assign y = a & b;
    endmodule

module multiple_module_opt2(input a , input b , input c , input d , output y);
wire n1,n2,n3;

sub_module U1 (.a(a) , .b(1'b0) , .y(n1));
sub_module U2 (.a(b), .b(c) , .y(n2));
sub_module U3 (.a(n2), .b(d) , .y(n3));
sub_module U4 (.a(n3), .b(n1) , .y(y));

endmodule</pre>

#### Example showing the sequence of commands to perform combinational logic optimization using Yosys on multiple_module_opt2 in multiple_module_opt2.v:


        read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	read_verilog multiple_module_opt2.v 
    	synth -top multiple_module_opt2
    	opt_clean -purge
    	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
    	show
        write_verilog -noattr multiple_module_opt2_flat.v
	
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/4b0cf916-c6f4-4ddb-b4c5-85e883372ce0)

### * Sequential logic optimization

Optimization technique used when a constant value is propagated through a flip-flop -- i.e., irrespective of the state of the triggering signals (CLK, Reset,Set) there are no transitions in the flip-flop output.

Other, more advanced, types of Sequential optimisations are not covered in the labs, but are:

State: Optimisation of unused states and/or the total states needed in the FSM are minimized.

Cloning: Physical aware synthesis, for example reduce physical distance.
This is a physically-aware (PnR-aware) optimization method where some of the flops in the design are cloned/ duplicated so that the timing can be met post-PnR for the timing arcs involved (provided there is already some minimum positive slack available).

Retiming: The pipelining flops in the design are placed optimally so that the combinational delay at each pipeline stage is more or less equalized so that the maximum clock frequency can be increased.
For example spread/partitioning the logic based on timing analysis to work on higher frequencies.

Sometimes a verilog RTL code may generate DFF with sequential constant and some of them we may replace to wires with static values. There are some examples with replacement and without.

#### Example showing the sequence of commands to perform combinational logic optimization using Yosys

	yosys> read_liberty -lib ../path_of_library_file/library.lib
	yosys> read_verilog design_verilog_file.v
	yosys> synth -top module_name
	yosys> dfflibmap -liberty ../path_of_library_file/library.lib
	yosys> abc -liberty ../path_of_library_file/library.lib
	yosys> show 

Files used here are named with dff_const:

<pre><font color="#12488B"><b>verilog_files</b></font>$ la *df*const*</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/4d601be3-2785-4b72-8aa3-1c1922e17196)

###### Ex: 1) D f/f sequential constant (dff_const1.v)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/6c2a917b-2c2b-481c-9221-defef31f6ac6)

<pre>module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b0;
	else
		q <= 1'b1;
end
endmodule</pre>

In this example, no optimization is possible as the flop output, q changes.

- Behavioral Simulation
  
<pre><font color="#12488B"><b>verilog_files</b></font>$ iverilog dff_const1.v tb_dff_const1.v
<font color="#12488B"><b>verilog_files</b></font>$ ./a.out
<font color="#12488B"><b>verilog_files</b></font>$ gtkwave tb_dff_const1.vcd</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/4ec9a922-5a0c-4438-b9ec-474ca1c23307)

-Synthesis

	$ yosys
	yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> read_verilog dff_const1.v
	yosys> synth -top dff_const1
	yosys> dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> show

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/b7fdb125-0a3c-4c34-a344-a8ee699be78b)

###### Ex: 2) D f/f sequential constant (dff_const2.v)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/7a7cdf23-43d6-48f3-9ef6-f26d60fdbfc8)

	module dff_const2(input clk, input reset, output reg q);
	always @(posedge clk, posedge reset)
		begin
			if(reset)
			q <= 1'b1;
		else
			q <= 1'b1;
	end

	endmodule
 
Here, the the flip-flop output, q remains constant at 1 irrespective of the other signals in the sensitivity list.
Thus the realization does not need any cells and q is connected to 1'b1.

- Behavioral Simulation

	<pre><font color="#12488B"><b>verilog_files</b></font>$ iverilog dff_const2.v tb_dff_const2.v
		<font color="#12488B"><b>verilog_files</b></font>$ ./a.out
		<font color="#12488B"><b>verilog_files</b></font>$ gtkwave tb_dff_const2.vcd</pre>

  
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/fbfbf756-131d-4d26-8490-232012cac985)

-Synthesis

        $ yosys
	yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> read_verilog dff_const1.v
	yosys> synth -top dff_const1
	yosys> dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> show
 
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/904b6710-7349-4654-8dd6-28a0a137503b)

 ###### Ex: 3) D f/f sequential constant (dff_const3.v)

<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim dff_const3.v</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/86024379-4db4-48e2-bf5f-7c1b68b22cd0)

<pre>module dff_const3(input clk, input reset, output reg q);
reg q1;

always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q <= 1'b1;
		q1 <= 1'b0;
	end
	else
	begin
		q1 <= 1'b1;
		q <= q1;
	end
end

endmodule</pre>

Here, both q1 & q have transitions and thus cannot be optimized further. So the design will have two DFFs.

<pre><font color="#12488B"><b>verilog_files</b></font>$ iverilog dff_const3.v tb_dff_const3.v
	<font color="#12488B"><b>verilog_files</b></font>$ ./a.out
	<font color="#12488B"><b>verilog_files</b></font>$ gtkwave tb_dff_const3.vcd</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/2a6161a3-1a29-46c8-93bd-067793be1f3b)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/ed9d6d70-d39c-4313-93d2-edbaaf87ba6e)

 ###### Ex: 4) D f/f sequential constant (dff_const4.v)
 
<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim dff_const4.v</pre>

<pre>module dff_const4(input clk, input reset, output reg q);
reg q1;

always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q <= 1'b1;
		q1 <= 1'b1;
	end
	else
	begin
		q1 <= 1'b1;
		q <= q1;
	end
end

endmodule</pre>

In this example, both q1 & q remain constant at 1'b1. Thus, the design can be optimized to have only wires. Further, 
q1 being an internal net can also be removed.
	
 	$ gvim dff_const4.v
	$ iverilog dff_const4.v tb_dff_const4.v
	$ ./a.out
        $ gtkwave tb_dff_const4.vcd
	
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/d046b8e4-0a80-403c-9ab5-e7479c3e8384)

-Synthesis

        $ yosys
	yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> read_verilog dff_const1.v
	yosys> synth -top dff_const1
	yosys> dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> show

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/aa303577-3c4e-45f7-b278-cccdd71a2ec2)

###### Ex: 5) D f/f sequential constant (dff_const5.v)

<pre><font color="#12488B"><b>verilog_files</b></font>$ gvim dff_const5.v</pre>

<pre>module dff_const5(input clk, input reset, output reg q);
reg q1;

always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q <= 1'b0;
		q1 <= 1'b0;
	end
	else
	begin
		q1 <= 1'b1;
		q <= q1;
	end
end
endmodule</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/d02d8de6-4370-43d5-ad7f-56e77f380fa9)

	$ gvim dff_const5.v
	$ iverilog dff_const5.v tb_dff_const5.v
	$ ./a.out
        $ gtkwave tb_dff_const5.vcd
	

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/728de7b8-89a9-46d8-91c2-ee4729707775)

### Sequential optimizations for unused outputs 

##### Example 6: counter_opt.v

Sometimes we don't use all features of a verilog module. In this case an optimizer will remove unused part for safe space and power.

<pre>$ gvim counter_opt.v</pre>

<pre>module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = count[0];
always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end
endmodule</pre>

This design serves as an example for Sequential logic optimization with designs having unused outputs.
Although we have a 3-bit up counter in the RTL design, only the LSB, count[0:0] is used for generating the output signal, q.
Since count[0:0] toggles every clock cycle, there really is a need for only one flip-flop in the circuit.
In other words, the synthesis output does not have a 3-bit up counter and its associated count incrementing logic.

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/0ab60602-6b27-46de-961f-c6f0b99f98cf)

**** Behavioral Simulation

<pre>$ iverilog counter_opt.v tb_counter_opt
 ./a.out
$ gtkwave tb_counter_opt.vcd</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/623c838e-7665-4134-af6c-e50d3ea89c1a)

Synthesis Result w/o opt_clean switch

        <pre>$ yosys
	yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> read_verilog counter_opt.v
	yosys> synth -top counter_top
	yosys> dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> show</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/d290881f-ef9a-4726-a5a7-d42067f73e6a)

Synthesis Result with opt_clean switch

	<pre>$ yosys
	yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> read_verilog counter_opt.v
	yosys> synth -top counter_top
 	yosys> opt_clean -purge
	yosys> dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> show</pre>
 
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/028435c1-2105-4518-8b00-ff33cdf71058)

##### Example 7: counter_opt2.v

<pre>$ gvim counter_opt.v
$ cp counter_opt.v counter_opt2.v
$ gvim counter_opt2.v</pre>

<pre>module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = (count[2:0] == 3'b100); 

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end
endmodule</pre>

In this design, we have a 3-bit up counter and all the bits in the counter state value, count[2:0] are used for generating the output signal, q.
q = 1, when count[2:0] = 3'b100
So when this design is synthesized, we expect 3 DFF instantiations to be present along with the count incrementing logic and the logic to generate, q.

Exercise: Make testbench of counter_opt2.v and then find behavioural simulation.

Synthesis Result with opt_clean switch

	$ yosys
	yosys> read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> read_verilog counter_opt2.v
	yosys> synth -top counter_top
 	yosys> opt_clean -purge
	yosys> dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	yosys> show

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/bc9655da-8fac-4181-89f0-9081e097f36c)

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/adb1aa5d-2baa-4df6-8f6e-c38c7cbe48d8)


## Day 4
#### Gate Level Simulation (GLS), Synthesis-Simulation mismatch and Blocking/Non-blocking statements  


    * Gate Level refers to the netlist view of a design after the synthesis has been performed.
    * RTL simulations are pre-synthesis, while GLS is post-synthesis - i.e., in RTL simulations, the Device Under Test (DUT) is the RTL design itself         while in GLS, the DUT is the netlist generated after synthesis.
    * The RTL code and the generated netlist are logically equivalent (well, supposed to be!) and hence the same testbenches can be used to verify both.
    * Although it is expected that the generated netlist has the same logical correctness as the RTL design, there can sometimes be mismatches between        the RTL-level simulation and the sythesized design (Synthesis - Simulation mismatch) and thus arises the need to run GLS to help identify such  
      scenarios and fix them to ensure the logical correctness post-synthesis as well.

   To run GLS, we need to provide the Gate level netlist, the testbench and the Gate Level verilog models to the simulator. GLS can be run in different delay modes:

    * Functional validation (zero delay similar to RTL sim): if the Gate Level verilog models do not have the timing information for various corners,         we can only verify the functional correctness of the design by running GLS.
    * Full Timing validation: if the Gate level verilog models have the necessary timing information, both the functional correctness and the timing  
      behaviour can be verified by GLS.

GLS Flow using iverilog

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/6c480e89-83f6-461c-90b8-4188da87823f)

The Gate level verilog model(s) need to be provided as shown below to do GLS using iverilog:

Syntax:

    iverilog <path-to-gate-level-verilog-model(s)> <netlist_file.v> <tb_top.v>

Example using ternary_operator_mux_netlist.v:

    iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v ternary_operator_mux_netlist.v tb_ternary_operator_mux.v

#### Synthesis - Simulation mismatch

Some of the common reasons for Synthesis - Simulation mismatch (mismatch between pre- and post-synthesis simulations) :

    1) Incomplete sensitivity list
    2) Use of blocking assignments inside always block vs. non-blocking assignments
       - Blocking assignments ("=") inside always block are executed sequentially by the simulator.
       - The RHS of non-blocking assignments ("<=") are evaluated first and then assigned to the LHS at the same simulation clock tick by the simulator.
       - Synthesis will yield the same circuit with blocking and non-blocking assignments, with the synthesis output being that of the non-blocking 
         case for both.
       - Hence, if the RTL was written assuming one functionality using blocking assignments, a simulation mismatch can occur in GLS.
    3) Non-standard verilog coding

GLS Synthesis - Simulation mismatch - Example 1: ternary_operator_mux.v

<pre>$ gvim ternary_operator_mux.v</pre>

Verilog snippet

<pre>module ternary_operator_mux (input i0 , input i1 , input sel , output y);
	assign y = sel?i1:i0;
	endmodule</pre>

RTL Simulation 

Begin by checking the current waveform of the code (ternary_operator_mux.v):

<pre>$ iverilog ternary_operator_mux.v tb_ternary_operator_mux.v
     $ ./a.out
     $ gtkwave tb_ternary_operator_mux.vcd</pre>
     
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/444ca772-89ec-4465-bc0b-afe54cf4f2db)

Then, synthesize and write the GLS netlist:

	yosys
	read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	read_verilog ternary_operator_mux.v
	synth -top ternary_operator_mux
	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	write_verilog -noattr ternary_operator_mux_net.v
	show

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/3a76b426-3ab5-4856-9905-4b327718606d)

Netlist output

<pre>$ gvim ternary_operator_mux_net.v

/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module ternary_operator_mux(i0, i1, sel, y);
  wire _0_;
  wire _1_;
  wire _2_;
  wire _3_;
  input i0;
  input i1;
  input sel;
  output y;
  sky130_fd_sc_hd__mux2_1 _4_ (
    .A0(_0_),
    .A1(_1_),
    .S(_2_),
    .X(_3_)
  );
  assign _0_ = i0;
  assign _1_ = i1;
  assign _2_ = sel;
  assign y = _3_;
endmodule</pre>

Next, perform GLS simulation:

iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v ternary_operator_mux_net.v tb_ternary_operator_mux.v

./a.out

gtkwave tb_ternary_operator_mux.vcd

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/dc6b9a75-2f0a-4676-ae1e-71192ce19091)

GLS Synthesis - Sumulation mismatch - Example 2: bad_mux.v

<pre>$ gvim bad_mux.v</pre>

Verilog snippet

<pre>module bad_mux (input i0 , input i1 , input sel , output reg y);
always @ (sel)
begin
	if(sel)
		y <= i1;
	else 
		y <= i0;
end
endmodule</pre>

RTL Simulation 

Begin by checking the current waveform of the code (bad_mux.v):

<pre>$ iverilog bad_mux.v tb_bad_mux.v
     $ ./a.out
     $ gtkwave tb_bad_mux.vcd</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/0af41d7e-fa27-457c-b5d7-35faa18f0b33)


Then, synthesize and write the GLS netlist:

	yosys
	read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	read_verilog bad_mux.v
	synth -top bad_mux
	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	write_verilog -noattr bad_mux_net.v
	show

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/5aa8baec-4e77-42aa-91a3-807bd69eae4e)

Netlist output

<pre>$ gvim bad_mux_net.v

/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module bad_mux(i0, i1, sel, y);
  wire _0_;
  wire _1_;
  wire _2_;
  wire _3_;
  input i0;
  input i1;
  input sel;
  output y;
  sky130_fd_sc_hd__mux2_1 _4_ (
    .A0(_0_),
    .A1(_1_),
    .S(_2_),
    .X(_3_)
  );
  assign _0_ = i0;
  assign _1_ = i1;
  assign _2_ = sel;
  assign y = _3_;
endmodule</pre>

Next, perform GLS simulation:

	iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v bad_mux_net.v tb_bad_mux.v

	./a.out

	gtkwave tb_bad_mux.vcd
	
	
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/a7e0c07d-ab99-4bf4-b312-e5197a3eca1f)


	In this case, we can clearly see that there is a mismatch in the simulation between pre and post-synthesis.
	The pre-synthesis simulation shows a behavior resembling that of a posedge triggered DFF with the "sel" signal acting as the CLK and the "i1" 		acting as the D input.
	The synthesis result, however, is a 2-input mux and not a DFF.
	In fact, yosys actually throws a warning message about the possible omission of signals from the sensitivity list assuming a purely 		
 	combinational circuit.

Yosys warning about missing signals in sensitivity list
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/72fec9ca-29b3-49d1-bc0a-54ba33a64195)


GLS Synthesis - Synthesis-Simulation mismatch for blocking statement - Example 3: blocking_caveat.v

<pre>$ gvim blocking_caveat.v</pre>

Verilog snippet

<pre>module blocking_caveat (input a , input b , input  c, output reg d); 
reg x;
always @ (*)
begin
	d = x & c;
	x = a | b;
end
endmodule</pre>

In this case, there is a mismatch in the simulation results between pre and post-synthesis due to the use of blocking assignments. Assuming we wanted to implement just a combinational logic with output, d = (a + b) * c:

    . In the RTL sim, the blocking assignments make it seem as if there is a flop in the design.
    . While in the GLS, the design is synthesized to a O2A1 gate implementing d = (a + b) * c, with no flops inferred, thus resulting in the mismatch.


RTL Simulation 

Begin by checking the current waveform of the code (bad_mux.v):

<pre>$ iverilog blocking_caveat.v tb_blocking_caveat.v
     $ ./a.out
     $ gtkwave tb_blocking_caveat.vcd</pre>

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/9545cacf-be98-49c7-b667-f9bb3c1bb21f)


Then, synthesize and write the GLS netlist:

	yosys
	read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	read_verilog blocking_caveat.v
	synth -top blocking_caveat
	abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
	write_verilog -noattr blocking_caveat_net.v
	show

![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/f8b5c9d4-32b0-4e13-8fd5-032b0021f8e5)

Netlist output

<pre>$ gvim blocking_caveat_net.v

     /* Generated by Yosys 0.9 (git sha1 1979e0b) */

module blocking_caveat(a, b, c, d);
  wire _0_;
  wire _1_;
  wire _2_;
  wire _3_;
  wire _4_;
  input a;
  input b;
  input c;
  output d;
  sky130_fd_sc_hd__o21a_1 _5_ (
    .A1(_2_),
    .A2(_1_),
    .B1(_3_),
    .X(_4_)
  );
  assign _2_ = b;
  assign _1_ = a;
  assign _3_ = c;
  assign d = _4_;
endmodule</pre>

Next, perform GLS simulation:

	iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v blocking_caveat_net.v tb_blocking_caveat.v

	./a.out

	gtkwave tb_blocking_caveat.vcd
	
![image](https://github.com/ManjuLanjewar/vsd-hdp/assets/157192602/b4908a8a-3d39-43a4-8117-5b86cc3a159d)

Mismatch behavior found. Rewrite Verilog RTL to fix it.

##### Day 5
*** Arithmetic Logic Unit 

The ALU is the mathematical brain of a computer. The first ALU was INTEL 74181 implemented as a 7400 series.
It is a TTL integrated circuit that was released in 1970.
An arithmatic logic unit is fundamental building block of central processing unit which performs arithmatic and logic operations. 
An 4-bit arithmetic logic unit (ALU) is a combinational circuit which operates on two 4-bit input buses
based on selection inputs. The ALU performs common arithmetic operations like addition,subtraction multiplication and division and logic
operations like AND, INV, XOR, and OR. 

Inputs and outputs are as follows:

<pre>$ gvim alu_4_bit.v

module alu_4_bit(A,B,clk,rst,mode,y);

	input[3:0]A,B;
	input clk,rst;
	output reg [7:0]y;
        input[2:0]mode;
    always@(posedge clk)begin
	   	
        if(rst) begin

	    y<= 8'b0000_0000;
        end
	   // else begin
		case(mode)
           3'b000: y<= A+B;
     	   3'b001: y<= A-B;
	   3'b010: y<= A*B;
	   3'b011: y<= A/B;
	   3'b100: y<= A & B;
	   3'b101: y<= A | B;
 	   3'b110: y<= A ^ B;
	   3'b111: y<= ~A;
           default:y<= 8'b0000_0000;
       endcase
     //  end
      
   end 
endmodule</pre>






