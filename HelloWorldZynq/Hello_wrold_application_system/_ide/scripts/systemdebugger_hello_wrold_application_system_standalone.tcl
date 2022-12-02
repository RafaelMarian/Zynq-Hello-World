# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\Licenta\HelloWorldZynq\Hello_wrold_application_system\_ide\scripts\systemdebugger_hello_wrold_application_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\Licenta\HelloWorldZynq\Hello_wrold_application_system\_ide\scripts\systemdebugger_hello_wrold_application_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo 210279535867A" && level==0 && jtag_device_ctx=="jsn-Zybo-210279535867A-13722093-0"}
fpga -file D:/Licenta/HelloWorldZynq/Hello_wrold_application/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/Licenta/HelloWorldZynq/hello_world_minized_platform/export/hello_world_minized_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/Licenta/HelloWorldZynq/Hello_wrold_application/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/Licenta/HelloWorldZynq/Hello_wrold_application/Debug/Hello_wrold_application.elf
configparams force-mem-access 0
bpadd -addr &main
