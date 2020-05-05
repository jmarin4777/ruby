require_relative 'human'
class Ninja < Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize()
        super
        @stealth = 175
        self
    end

    def steal(human)
        attack(human)
        @health += 10
        self
    end

    def get_away()
        @health -= 15
    end
end

bob = Human.new
joe = Ninja.new

bob.attack(joe)
joe.steal(bob)
puts "joe " + joe.health.to_s
puts "bob " + bob.health.to_s

joe.get_away()
puts "joe " + joe.health.to_s
