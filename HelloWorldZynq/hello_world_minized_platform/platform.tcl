# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\Licenta\HelloWorldZynq\hello_world_minized_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\Licenta\HelloWorldZynq\hello_world_minized_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {hello_world_minized_platform}\
-hw {D:\Licenta\HelloWorldZynq\project_1_HelloWorld\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {D:/Licenta/HelloWorldZynq}

platform write
platform generate -domains 
platform active {hello_world_minized_platform}
bsp reload
bsp write
platform generate
