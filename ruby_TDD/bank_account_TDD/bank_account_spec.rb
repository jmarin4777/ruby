require_relative 'bank_account'
RSpec.configure do |c|
    c.raise_errors_for_deprecations!
end
RSpec.describe BankAccount do
    before(:each) do
        @bank_acc1 = BankAccount.new()
        @bank_acc2 = BankAccount.new()
        @bank_acc2.deposit("checking", 200)
        @bank_acc2.deposit("savings", 400)
    end
    it 'should have a getter method for the checking account balance' do
        expect(@bank_acc1.checking_balance).to eq(0)
    end

    it 'should have a getter method for the total account balance' do
        expect(@bank_acc2.total_balance).to eq(600)
    end

    context 'Bank account has funds' do
        it 'withdraws money from account' do
            @bank_acc2.withdraw("checking", 100)
            expect(@bank_acc2.checking_balance).to eq(100)
            expect(@bank_acc2.total_balance).to eq(500)
        end
    end

    context 'Bank account does not have any funds or does not have enough funds' do
        it 'Cannot withdraw money from account' do
            @bank_acc1.withdraw("checking", 100)
            @bank_acc2.withdraw("checking",300)

            expect(@bank_acc1.checking_balance).to eq(0)
            expect(@bank_acc1.total_balance).to eq(0)
            expect(@bank_acc2.checking_balance).to eq(200)
            expect(@bank_acc2.total_balance).to eq(600)
        end
    end

    it 'raises an error if a user tries to retrieve total number of bank accounts' do
        expect{@bank_acc1.accounts}.to raise_error(NoMethodError)
    end

    it 'raises an error when a user tries to set the interest rate' do
        expect{@bank_acc1.interest_rate = 0.02}.to raise_error(NoMethodError)
    end
end