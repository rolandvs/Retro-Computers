# THIS FILE IS AUTOMATICALLY GENERATED
# Project: C:\Users\HPz420\Documents\GitHub\Doug Gilliland\Retro-Computers\Z80\PSOC\PSOC_Design_Files\NSDSPI-master\ComponentTest\ComponentTest.cydsn\ComponentTest.cyprj
# Date: Mon, 18 Nov 2019 12:11:42 GMT
#set_units -time ns
create_clock -name {SD_CLK(routed)} -period 3225.8064516129029 -waveform {0 1612.90322580645} [list [get_pins {ClockBlock/dclk_0}]]
create_clock -name {Clock_1(routed)} -period 1000000 -waveform {0 500000} [list [get_pins {ClockBlock/dclk_1}]]
create_clock -name {CyILO} -period 1000000 -waveform {0 500000} [list [get_pins {ClockBlock/ilo}] [get_pins {ClockBlock/clk_100k}] [get_pins {ClockBlock/clk_1k}] [get_pins {ClockBlock/clk_32k}]]
create_clock -name {CyIMO} -period 41.666666666666664 -waveform {0 20.8333333333333} [list [get_pins {ClockBlock/imo}]]
create_clock -name {CyPLL_OUT} -period 16.129032258064516 -waveform {0 8.06451612903226} [list [get_pins {ClockBlock/pllout}]]
create_clock -name {CyMASTER_CLK} -period 16.129032258064516 -waveform {0 8.06451612903226} [list [get_pins {ClockBlock/clk_sync}]]
create_generated_clock -name {CyBUS_CLK} -source [get_pins {ClockBlock/clk_sync}] -edges {1 2 3} [list [get_pins {ClockBlock/clk_bus_glb}]]
create_generated_clock -name {SD_CLK} -source [get_pins {ClockBlock/clk_sync}] -edges {1 201 399} -nominal_period 3225.8064516129029 [list [get_pins {ClockBlock/dclk_glb_0}]]
create_generated_clock -name {Clock_1} -source [get_pins {ClockBlock/clk_sync}] -edges {1 62001 124001} [list [get_pins {ClockBlock/dclk_glb_1}]]

set_false_path -from [get_pins {__ONE__/q}]

# Component constraints for C:\Users\HPz420\Documents\GitHub\Doug Gilliland\Retro-Computers\Z80\PSOC\PSOC_Design_Files\NSDSPI-master\ComponentTest\ComponentTest.cydsn\TopDesign\TopDesign.cysch
# Project: C:\Users\HPz420\Documents\GitHub\Doug Gilliland\Retro-Computers\Z80\PSOC\PSOC_Design_Files\NSDSPI-master\ComponentTest\ComponentTest.cydsn\ComponentTest.cyprj
# Date: Mon, 18 Nov 2019 12:11:35 GMT
