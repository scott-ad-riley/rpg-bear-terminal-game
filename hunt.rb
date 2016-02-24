require_relative 'action'
require_relative 'animal'
class Hunt < Action

  def initialize(bear, difficulty)
    @bear = bear
    super(difficulty)
    bear.lose_food(scale(10))
  end

  def do()
    animal = find_animal()
    fight(animal)
  end

  def find_animal
    names = ["Boris", "Gladdis", "Rick", "Pete", "Scott", "Val", "Jeoff", "Voytek", "Adam", "Alisair","Alison","Claire"]
    type = ["Giraffe", "Honey Badger", "Lion", "Tiger", "Gorilla", "Python", "Ant", "Software Developer", "Monkey", "Human", "Penguin","Snow Leopard"]
    damage = [10,10,10,10,15,15,15,20,30,40,50]
    animal = Animal.new(names.sample, type.sample, damage.sample)
    return animal
  end

  def fight(animal)
    @bear.lose_energy(scale(20))

    puts "You will have to fight #{animal.name} the #{animal.type} to get your dinner!"
    puts "Do you want to fight? (y or n)"
    user_input = gets.chomp

      if user_input == "n"
        @bear.lose_energy(scale(20))
        puts "Your mighty bear is no loger mighty and is a Cowardly Bear!"
      elsif user_input == "y"
        puts "#{animal.name} the #{animal.type} has #{animal.damage} damage"
        puts "you have #{@bear.damage} damage"
        puts ""
        sleep(2)

        damage_difference = @bear.damage - animal.damage

          if damage_difference < 0
            puts "#{animal.name} the #{animal.type} wins. You go hungry and loose #{damage_difference * -1} health"
              @bear.take_damage(damage_difference)
          else 
            puts "Your mighty Bear hunts well and gains #{scale(damage_difference) * 2 } food!"
            @bear.give_food(scale(damage_difference) * 2 )
          end

      else 
        puts "You can't type let alone fight a bear. On the way home you trip over and lose 10 health"
        @bear.take_damage(10)
      end

    gets.chomp
    @bear.give_food(30)
    @bear.lose_energy(scale(20))
    
  end

end