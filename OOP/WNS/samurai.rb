require_relative 'human'
class Samurai < Human
    @@no_of_samurai = 0
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize()
        super
        @health = 200
        @@no_of_samurai += 1
        self
    end

    def death_blow(human)
        x = human.health
        attack(human, x)
        self
    end

    def meditate()
        @health = 200
        self
    end

    def how_many()
        puts @@no_of_samurai
    end
end

bob = Human.new
joe = Samurai.new
billy = Samurai.new

bob.attack(joe)
joe.death_blow(bob)
puts "joe " + joe.health.to_s
puts "bob " + bob.health.to_s

joe.meditate
puts "joe " + joe.health.to_s

joe.how_many
