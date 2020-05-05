class AppleTree
    attr_accessor :age
    attr_reader :height, :apples
    def initialize
        @age = 0
        @height = 1
        @apples = 0
    end

    def year_gone_by
        @age += 1
        @height += 0.1 * @height
        if @age > 3 && @age <= 10
            @apples += 2
        end
        self
    end

    def pick_apples
        @apples = 0
    end
end
