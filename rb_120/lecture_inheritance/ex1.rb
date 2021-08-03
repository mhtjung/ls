class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "Can't swim!"
  end
end

class Cat < Dog 
  def swim
    "Can't swim!"
  end

  def fetch
    "Can't fetch!"
  end
end

fuzz = Cat.new
p fuzz.swim
p fuzz.fetch