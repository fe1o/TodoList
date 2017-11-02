class List
  attr_reader :all_tasks
  def initialize
    @all_tasks = []
  end
  def add(task)
    all_tasks << task
  end
  def to_s
    all_tasks.map(&:description).join("\n")
  end
  def writer(filename)
    savedtasks = all_tasks.map(&:description).join("\n")
		open(filename, 'a') do |file|
			file.puts savedtasks
		end
  end
   def read_from_file(filename)
   	IO.readlines(filename).each do |line|
    	add(Task.new(line.chomp))
   	end
   end
	def delete(task_number)
		all_tasks.delete_at(task_number)
	end
	def show_list
		i = 0
		all_tasks.each{
				|task|
				puts "#{i}) #{task.to_s}"
				i = i + 1
				}
	end
end
class Task
  attr_reader :description
  def initialize(description)
    @description = description
  end
	def to_s
		description
	end
end