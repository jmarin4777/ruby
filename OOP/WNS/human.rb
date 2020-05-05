class Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize()
        @strength = 3
        @intelligence = 3
        @stealth = 3
        @health = 100
        self
    end
    
    def attack(human, amount=10)
        if human.class.ancestors.include? Human
            human.health -= amount       
        end
        self
    end
end
# bob = Human.new
# joe = Human.new
# bob.strength = 5
# bob.attack(joe)
# joe.attack(bob)
# puts joe.health
# puts bob.health