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
    savedtasks = all_tasks.map(&:stats).join("\n")
		open(filename, 'a') do |file|
			file.puts savedtasks
		end
  end
   def read_from_file(filename)
  		IO.readlines(filename).each{  
		 		|line|
      	status, *description = line.split(':')
      	status = status.include?('X')
      	add(Task.new(description.join(':').strip, status))
		}
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
  def updater(task_number, task)
    all_tasks[task_number] = Task.new(task)
  end
	def toggler(task_number)
		all_tasks[task_number].toggle_status
	end
end

class Task
  attr_reader :description
	attr_accessor :status
	def initialize(description, status = false)
  	@description = description
    @status = status
  end
	def to_s
		description
	end
	def completed?
		status
	end
	def stats
		"#{represent_status}: #{description}"
	end
	def toggle_status
		@complete_status = !completed?
	end
private

	def represent_status
		"#{completed? ? '[X]' : '[ ]'}"
	end
end
