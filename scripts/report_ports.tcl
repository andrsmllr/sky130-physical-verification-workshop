proc report_ports {} {
  set start_idx [port first]
  set stop_idx [port last]
  puts "Index\tName\t\Use\tClass"
  for {set idx $start_idx} {$idx <= $stop_idx} {incr idx} {
    puts "$idx\t[port $idx name]\t[port $idx use]\t[port $idx class]"
  }
}
