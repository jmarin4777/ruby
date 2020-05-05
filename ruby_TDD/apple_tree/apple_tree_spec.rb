require_relative 'apple_tree'
# RSpec.configure do |c|
#     c.raise_errors_for_deprecations!
# end
RSpec.describe AppleTree do
    before(:each) do
        @apple_tree1 = AppleTree.new
    end

    it 'has getter and settor methods for an age attribute' do
        expect(@apple_tree1.age).to eq(0)
    end

    it 'has a getter method ONLY for a height attribute' do
        expect(@apple_tree1.height).to eq(1)
        expect{@apple_tree1.height = 2}.to raise_error(NoMethodError)
    end

    it 'has a getter method ONLY for a apple counter attribute' do
        expect(@apple_tree1.apples).to eq(0)
        expect{@apple_tree1.apples = 1}.to raise_error(NoMethodError)
    end

    it 'has a year_gone_by method which adds a year, increases height by 10%, and adds to apples' do
        @apple_tree1.year_gone_by
        expect(@apple_tree1.age).to eq(1)
        expect(@apple_tree1.height).to eq(1.1)
        expect(@apple_tree1.apples).to eq(0)
    end

    context 'Apple tree between age less than 4' do
        it 'should not grow apples from age 0-3' do
            @apple_tree1.year_gone_by.year_gone_by.year_gone_by
            expect(@apple_tree1.apples).to eq(0)
        end
    end

    context 'Apple tree between age 4-9' do
        it 'should grow apples from age 4-9' do
            @apple_tree1.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by
            expect(@apple_tree1.apples).to eq(14)
        end
    end

    context 'Apple tree between age greater than 10' do
        it 'should not grow apples when older than 10' do
            @apple_tree1.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by
            expect(@apple_tree1.apples).to eq(14)
        end
    end

    it 'has a pick_apples method that picks all the apples off the tree' do
        @apple_tree1.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by.year_gone_by
        @apple_tree1.pick_apples
        expect(@apple_tree1.apples).to eq(0)
    end
end