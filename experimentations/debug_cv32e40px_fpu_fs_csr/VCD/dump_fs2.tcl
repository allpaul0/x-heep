set R TOP.testharness.x_heep_system_i.core_v_mini_mcu_i.cpu_subsystem_i.gen_cv32e40px.cv32e40px_top_i.core_i.id_stage_i.register_file_i
set S TOP.testharness.gen_USE_EXTERNAL_DEVICE_EXAMPLE.gen_fpu_ss_wrapper.fpu_ss_wrapper_i.fpu_ss_i.gen_fp_register_file.fpu_ss_regfile_i

foreach i {0 8 13 14 15} {
    foreach base [list "$R.mem_fp" "$S.mem"] {
        set s "${base}($i)\[31:0\]"
        puts "=== $s"
        if {[catch {set l [gtkwave::signalChangeList $s -max 200]} err]} {
            puts "  ERROR: $err"
            set l {}
        }
        foreach {t v} $l { puts "  $t $v" }
    }
}
gtkwave::/File/Quit