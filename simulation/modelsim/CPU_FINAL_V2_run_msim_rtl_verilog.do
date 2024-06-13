transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/artur/Downloads/CPU_FINAL_V2 {C:/Users/artur/Downloads/CPU_FINAL_V2/register_bank.v}
vlog -vlog01compat -work work +incdir+C:/Users/artur/Downloads/CPU_FINAL_V2 {C:/Users/artur/Downloads/CPU_FINAL_V2/tb_register_bank.v}

vlog -vlog01compat -work work +incdir+C:/Users/artur/Downloads/CPU_FINAL_V2 {C:/Users/artur/Downloads/CPU_FINAL_V2/tb_register_bank.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_register_bank

add wave *
view structure
view signals
run -all
