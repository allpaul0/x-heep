set nfacs [ gtkwave::getNumFacs ]
for {set i 0} {$i < $nfacs} {incr i} { puts [ gtkwave::getFacName $i ] }
gtkwave::/File/Quit