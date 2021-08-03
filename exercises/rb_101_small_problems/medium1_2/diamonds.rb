def create_diamonds(n)
  diamonds = []
  1.upto(n).each { |x| diamonds << x if x.odd? }
  (n - 1).downto(1).each { |x| diamonds << x if x.odd? }
  diamonds
end

def diamond(n)
  diamonds = create_diamonds(n)
  diamonds.each { |num_of_diamonds| puts ('*' * num_of_diamonds).center(n) }
end

diamond(9)
