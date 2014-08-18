require "./lib/station.rb"
require "./lib/train.rb"
require "./lib/stops.rb"
require "pg"

DB = PG.connect({:dbname => "train_test"})

def main_menu

  puts "\n***Train System***\n"

  loop do
    puts "\nEnter '1' to go to the train line menu"
    puts "Enter '2' to go to the station menu"
    puts "Enter '3' to go to the stop menu"
    puts "Enter 'x' to exit"

    user_choice = gets.chomp.downcase
    if user_choice == '1'
      line_menu
    elsif user_choice == '2'
      station_menu
    elsif user_choice == '3'
      stop_menu
    elsif user_choice == 'x'
      exit
    else
      puts "Not a valid entry"
    end
  end
end


main_menu
