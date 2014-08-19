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

def view_lines_by_station
  view_stations
  puts "\nEnter the index number for the station you want to view:\n"
  station_id = gets.chomp.to_i
  puts "\nThe trains for station #{station_id} are:\n"
  trains = Train.find_trains_through_station(station_id)
  trains.each do |train|
    puts "#{train.id}. #{train.name}"
  end
  puts "\n"
end

def station_menu
  puts "\nEnter 'a' to add a station"
  puts "Enter 'v' to view all stations"
  puts "Enter 'm' to return to the main menu"
  puts "Enter 'x' to exit"

  user_choice = gets.chomp

  if user_choice == 'a'
    add_station
  elsif user_choice == 'v'
    view_stations
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

def stop_menu
  puts "\nEnter 'a' to add a stop"
  puts "Enter 'v' to view all stops"
  puts "Enter 'm' to return to the main menu"
  puts "Enter 'x' to exit"

  user_choice = gets.chomp

  if user_choice == 'a'
    add_stop
  elsif user_choice == 'v'
    view_stops
  elsif user_choice == 'x'
    exit
  elsif user_choice != 'm'
    puts "\nNot a valid entry\n"
  end
end

def add_stop
  puts "\nWould you like to add a stop by train line or by station?"
  puts "Enter 'l' for train or 's' for station"
  user_choice = gets.chomp

  if user_choice == 'l'
    train_stop
  elsif user_choice == 's'
    station_stop
  else
    puts "Not a valid entry."
  end
end

def train_stop
  view_lines
  puts "Please select the index number of the train line for the new stop:"
  line_id = gets.chomp.to_i

  view_stations
  puts "\nPlease select the index number of the station for the new stop:"
  station_id = gets.chomp.to_i

  Stop.new({:line_id => line_id, :station_id => station_id}).save
  puts "Stop for line #{line_id} at station #{station_id} has been created.\n"
end

main_menu
