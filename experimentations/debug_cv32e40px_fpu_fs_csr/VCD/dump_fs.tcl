set sigs {
    TOP.testharness.dut.cpu_subsystem_i.cv32e40px_top_i.core_i.cs_registers_i.mstatus_fs_q
    TOP.testharness.dut.cpu_subsystem_i.cv32e40px_top_i.core_i.fs_off
    TOP.testharness.dut.cpu_subsystem_i.cv32e40px_top_i.core_i.id_stage_i.x_issue_valid_o
    TOP.testharness.dut.cpu_subsystem_i.cv32e40px_top_i.core_i.id_stage_i.illegal_insn_dec
}
foreach s $sigs {
    puts "=== $s"
    set l [ gtkwave::signalChangeList $s -start_time 0 -end_time [gtkwave::getMaxTime] -max 400 ]
    foreach {t v} $l { puts "  $t $v" }
}
gtkwave::/File/Quit