
def getword(type)
  print "Enter a #{type}: "
  word = gets.chomp
end


def madlibs
  noun = getword('noun')
  verb = getword('verb')
  adj = getword('adjective')
  adv = getword('adverb')

  puts "Do you #{verb} your #{adj} #{noun} #{adv}?"
end

madlibs
