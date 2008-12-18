class Monkeys
  
  @@monkeys = []
  
  def self.add_monkey(name)
    @@monkeys << name
  end
  
  add_monkey :john
  add_monkey :dave
  
  def self.monkeys
    @@monkeys
  end
  
end

puts Monkeys.monkeys