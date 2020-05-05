require_relative 'human'
class Wizard < Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize()
        super
        @health = 50
        @intelligence = 25
        self
    end

    def heal()
        @health += 10
        self
    end

    def fireball(human)
        attack(human, 20)
        self
    end
end

bob = Human.new
joe = Wizard.new

bob.attack(joe)
joe.fireball(bob)
puts joe.health
puts bob.health