require_relative 'project'
RSpec.configure do |c|
    c.raise_errors_for_deprecations!
end
RSpec.describe Project do
    before(:each) do
        # updated this block to create two projects
        @project1 = Project.new('Project 1', 'description 1')
        @project2 = Project.new('Project 2', 'description 2', "Jimmy")
    end

    it 'has a method elevator_pitch to explain name and description' do
        expect(@project1.elevator_pitch).to eq("Project 1, description 1")
        expect(@project2.elevator_pitch).to eq("Project 2, description 2")
    end

    it 'has a getter and a setter for owner attribute' do
        @project1.owner = "Billy"
        getter = @project2.owner
        
        expect(getter).to eq("Jimmy") # this would fail if no getter exists
        expect(@project1.owner).to eq("Billy") # this would fail if no setter exists
    end

    context 'has tasks' do
        it 'should display tasks' do
            @project1.tasks = [{name: "Clean the bathrooms", finished: false}]
            expect(@project1.tasks).to eq([{name: "Clean the bathrooms", finished: false}])
        end
    end

    context 'has no tasks' do
        it 'should display empty array' do
            expect(@project1.tasks.empty?).to eq(true)
        end
    end

    it 'should add a single task' do
        @project1.add_tasks({name: "Vacuum", finished: true})
        expect(@project1.tasks).to eq([{name: "Vacuum", finished: true}])
    end

    it 'should print each task' do
        @project1.tasks = [{name: "Clean the bathrooms", finished: false}, {name: "Vacuum", finished: false}]
        expect{@project1.print_tasks}.to output('{:name=>"Clean the bathrooms", :finished=>false}'+"\n"+'{:name=>"Vacuum", :finished=>false}'+"\n").to_stdout
    end
end