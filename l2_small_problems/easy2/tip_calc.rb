def tip_calc()
  puts "What's the bill?"
  bill = gets.chomp.to_f
  puts "What's the tip percentage?"
  tip_rate = gets.chomp.to_f
  tip = (bill*(tip_rate/100)).round(2)
  total = (bill+tip)
  puts "The tip is $#{format("%.2f",tip)}"
  puts "The total is $#{format("%.2f",total)}"
end

tip_calc