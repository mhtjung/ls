module Borders

  def initialize
    @h_border = "#{'-' * 100}"
    @v_border = "|#{' ' * 98}|"
  end

  def display_cent(text)
    puts @h_border
    puts @v_border
    puts @v_border
    puts content(text)
    puts @v_border
    puts @v_border
    puts @h_border
  end

  def content(text)
    "|#{text.center(98)}|"
  end
end

class Test
  include Borders
end

test = Test.new
test.display_cent('Welcome to Blackjack!')