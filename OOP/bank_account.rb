class BankAccount
    @@accounts = 0 
    attr_reader :checking_balance, :savings_balance, :account_num, :interest_rate
    def initialize()
        @checking_balance = 0
        @savings_balance = 0
        @account_num = gen_account_num
        @interest_rate = 0.01

        @@accounts += 1
        self
    end

    def account_information()
        puts "Account Number: #{@account_num}"
        puts "Total Balance: #{@checking_balance+@savings_balance}"
        puts "Checking Balance: #{@checking_balance}"
        puts "Savings Balance: #{@savings_balance}"
        puts "Interest Rate: #{@interest_rate}"
        self
    end

    def deposit(account, amount)
        if account == "checking"
            checking(amount)
        elsif account == "savings"
            savings(amount)
        end
        self
    end

    def withdraw(account, amount)
        if account == "checking"
            if amount < @checking_balance
                checking(-amount)
            else
                puts "Not enough money in checking account."
            end
        elsif account == "savings"
            if amount < @savings_balance
                savings(-amount)
            else
                puts "Not enough money in savings account."
            end
        end
        self
    end

    private
    @@account_nums = (1..100).to_a.shuffle
    def gen_account_num()
        return @@account_nums.shift
    end

    def checking(amount)
        @checking_balance += amount
    end

    def savings(amount)
        @savings_balance += amount
    end
end

bob = BankAccount.new.account_information
puts "*"*100
jimmy = BankAccount.new.account_information
puts "*"*100

bob.withdraw("checking", 100)
bob.deposit("checking", 200)
bob.deposit("savings", 300)
jimmy.deposit("savings", 1000)
jimmy.withdraw("savings", 500)

puts "*"*100
bob.account_information
puts "*"*100
jimmy.account_information
puts "*"*100