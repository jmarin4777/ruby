def guess_number guess
    number = 25
    if guess == number
        return "You got it!"
    elsif guess < number
        return "Guess was too low!"
    elsif guess > number
        return "Guess was too high!"
    end
end 
puts guess_number 25
puts guess_number 0
puts guess_number 100
