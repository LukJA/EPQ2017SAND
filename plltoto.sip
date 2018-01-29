set_global_assignment -entity "plltoto" -library "lib_plltoto" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "plltoto" -library "lib_plltoto" -name IP_TOOL_VERSION "17.0"
set_global_assignment -entity "plltoto" -library "lib_plltoto" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_plltoto" -name SPD_FILE [file join $::quartus(sip_path) "plltoto.spd"]

set_global_assignment -library "lib_plltoto" -name MISC_FILE [file join $::quartus(sip_path) "plltoto_sim/plltoto.vho"]
