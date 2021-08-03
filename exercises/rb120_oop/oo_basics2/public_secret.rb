class Person

  attr_writer :secret
  
  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

john = Person.new
john.secret = 'Victoria'
john.share_secret