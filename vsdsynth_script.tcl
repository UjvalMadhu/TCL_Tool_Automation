#! /usr/bin/tclsh
set filename [lindex $argv 0]
package require csv
package require struct::matrix
struct::matrix m
set f [open $filename]
csv::read2matrix $f m , auto
close $f
set columns [m columns]
try {
    m link my_arr
} trap {TCL} {err} {
    puts "Error: $err"
}
set num_of_rows [m rows]
set i 0
puts "num_of_rows: $num_of_rows "
while {$i < $num_of_rows} { 
	puts "\nInfo: Setting $my_arr(0, $i) as '$my_arr(1, $i)'"
	if{$i == 0}{
		set [string map {" " ""} $my_arr(0, $i)] $my_arr(1,$i)
		}
	else {
		set [string map {" " ""} $my_arr(0,$i)] [file normalize $my_arr(1,$i)]
		}
	set i [expr {$i+1}]
}

	
puts "\n Info: Below are the list of initial variables and their values"
# puts "$my_arr(0,1) = $my_arr(1,1)"
# puts "$my_arr(0,2) = $my_arr(1,2)"
# puts "$my_arr(0,3) = $my_arr(1,3)"
# puts "$my_arr(0,4) = $my_arr(1,4)"
# puts "$my_arr(0,5) = $my_arr(1,5)"
# puts "$my_arr(0,6) = $my_arr(1,6)"
return




