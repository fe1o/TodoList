require_relative 'list'
module Menu
  def menu
    "     |---------------------------------------------------------|
     |--------------------t4rkus TODO list---------------------|
     |---------------------------------------------------------| 
     |Hey there, welcome. What you wanna do:(type your answer) |
     |Create - To create a list                                |
     |Add - To add a item to your list                         |
     |Write - To write the list in a text file                 |
     |Read - To read through a existing file                   |
     |Delete - To delete a Item from your list                 |
     |Show - To see the tasks of your list                     |
     |Exit - Close the program                                 |
     |---------------------------------------------------------| \n"
  end
  def show
    menu
  end
end

module Promptable
  def prompt(message = "Just the facts, ma'am.", symbol = 'Answer:> ')
    print message
    print symbol
    gets.chomp
  end
end

include Menu
include Promptable
until ['exit'].include?(asw = prompt(show).downcase)  
  case asw
    when "create"
      puts "Well done, what will be your list's name?"
      list_name = gets.chomp
      my_list = List.new
    when "add"
    	my_list.add(Task.new(prompt("What is the item you would like to add at the list?\n", ":>")))
		when "write"
      my_list.writer(prompt("Which will be the filename?\n", ":>"))
		when "read" 
    	begin
				my_list.read_from_file(prompt("What is the filename to read from?\n", ":>"))
				puts "You've added the itens of the file to the list"
       	rescue Errno::ENOENT
       		puts 'File name not found, please verify your file name and path.'
       	end
		when "delete"
			my_list.show_list
			my_list.delete(prompt("Which task do you wanna delete?(choose by the number)\n", ":>").to_i)
    when "show"
      print "The tasks of your list #{list_name} are:\n#{my_list} \n" 
    else
     puts "Invalid option, please type a valid one."
  end
	prompt('Press enter to continue', '')
end
puts 'Farewell user, thanks for using our awesome software!'