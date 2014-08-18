require "./lib/station.rb"
require "./lib/train.rb"
require "./lib/stops.rb"
require "pg"

DB = PG.connect({:dbname => "train_system"})

def main_menu

  puts "\n***Train System***\n"

  loop do
    puts "\nEnter '1' to go to the train line menu"
    puts "Enter '2' to go to the station menu"
    puts "Enter '3' to go to the stop menu"
    puts "Enter 'x' to exit"

    user_choice = gets.chomp.downcase
    if user_choice == '1'
      train_menu
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

def train_menu
  puts "\nEnter 'a' to add a line"
  puts "Enter 'v' to view lines"
  puts "Enter 's' to view all lines for a station"
  puts "Enter 'm' to return to the main menu"
  puts "Enter 'x' to exit"

  user_choice = gets.chomp

  if user_choice == 'a'
    add_line
  elsif user_choice == 'v'
    view_lines
  elsif user_choice == 's'
    view_lines_by_station
  elsif user_choice == 'x'
    exit
  elsif user_choice != 'm'
    puts "\nNot a valid entry\n\n"
  end
end

def add_line
  puts "\nPlease enter the name of the new train line:"
  user_input = gets.chomp
  Train.new({:name => user_input}).save
  puts "\nTrain '#{user_input}' has been created!\n"
end

def view_lines
  puts "\nHere are the existing train lines:"
  lines = Train.all
  lines.each do |line|
    puts "#{line.id}. #{line.name}"
  end
  puts "\n"
end

# def view_lines_by_station

def station_menu
  puts "\nEnter 'a' to add a station"
  puts "Enter 'v' to view all stations"
  puts "Enter 'l' to view all stations for a line"
  puts "Enter 'm' to return to the main menu"
  puts "Enter 'x' to exit"

  user_choice = gets.chomp

  if user_choice == 'a'
    add_station
  elsif user_choice == 'v'
    view_stations
  elsif user_choice == 'l'
    view_stations_by_line
  elsif user_choice == 'x'
    exit
  elsif user_choice != 'm'
    puts "\nNot a valid entry\n"
  end
end

def add_station
  puts "\nPlease enter station name:\n"
  user_input = gets.chomp
  Station.new({:name => user_input}).save
  puts "\nStation '#{user_input}' has been created!\n"
end

def view_stations
  puts "\nHere are the existing stations:\n"
  stations = Station.all
  stations.each do |station|
    puts "#{station.id}. #{station.name}"
  end
end


main_menu
