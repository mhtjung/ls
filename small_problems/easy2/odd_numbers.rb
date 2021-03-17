#print all odd numbers from 1 to 99, inclusive, to the console 
#with each number on a separate line

def odd_nums
  arr = (1..99).to_a
  arr.each do |x|
    puts x if x.odd?
  end
end

odd_nums

def odd_nums2
  1.upto(99) do |x|
    puts x if x.odd?
  end
end

odd_nums2