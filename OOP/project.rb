class Project
    attr_accessor :name, :desc, :owner, :tasks
    def initialize(name, desc, owner=nil, tasks=[])
        @name = name
        @desc = desc
        @owner = owner
        @tasks = tasks
    end

    def elevator_pitch()
        "#{@name}, #{@desc}"
    end

    def tasks()
        @tasks
    end

    def add_tasks(tasks)
        @tasks << tasks
    end

    def print_tasks()
        @tasks.each { |task| puts task }
    end
end
@project1 = Project.new('Project 1', 'description 1')
# @project1.elevator_pitch
@project1.tasks = [{name: "Clean the bathrooms", finished: false}, {name: "Vacuum", finished: false}]
@project1.print_tasks
# @project1.tasks.each {
#     |array_item| array_item.each { |k,v| puts "#{k}: #{v}" }
# }
# project1 = Project.new("Project 1", "Description 1")
# puts project1.name # => "Project 1"
# project1.elevator_pitch  # => "Project 1, Description 1"