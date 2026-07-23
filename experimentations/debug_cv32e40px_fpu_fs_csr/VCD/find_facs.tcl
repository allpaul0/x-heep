set nfacs [ gtkwave::getNumFacs ]
set pats { *mstatus_fs* *fs_off* *x_issue_valid* *x_issue_ready* *accept* \
           *illegal_insn* *fpr_we* *fpr_wb_addr* *mem_fp* *pc_id* *pc_if* }
for {set i 0} {$i < $nfacs} {incr i} {
    set fac [ gtkwave::getFacName $i ]
    foreach p $pats {
        if { [string match -nocase $p $fac] } { puts "$fac"; break }
    }
}
gtkwave::/File/Quit