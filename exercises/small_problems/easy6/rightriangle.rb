
def triangle(int)
  wspace = int -1
  asterisks = 1

  until asterisks == int+1
    puts (' ')*wspace + ('*' * asterisks)
    wspace -=1
    asterisks +=1
  end
end

triangle (100)