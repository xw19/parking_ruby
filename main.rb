#!/usr/bin/env ruby

require_relative "./lib/parking_zone.rb"
require_relative "./lib/parking_array.rb"
require_relative "./lib/parking_lot.rb"

puts "Enter capacity of Parking Lot"
max_capacity = gets.to_i

array_bike = ParkingArray.new(max_capacity)
array_car = ParkingArray.new(max_capacity)
bike_parking = ParkingZone.new('B', array_bike)
car_parking = ParkingZone.new('C', array_car)
parking = ParkingLot.new(bike_parking, car_parking)

while true do
    puts "Enter 1 to park bike"
    puts "2 to park car"
    puts "3 to remove Bike"
    puts "4 to park car"
    puts "5 to display spaces"
    puts "6 to search bike"
    puts "7 to search car"
    puts "0 to exit"
    puts "\n\n"

    j = gets.to_i
    begin
        if j == 1
            puts "Enter Registration number to park bike"
            parking.park_bike(gets)
        elsif j == 2
            puts "Enter Registration to park car"
            parking.park_car(gets)
        elsif j == 3
            puts "Enter Registration number to unpark bike"
            parking.remove_bike(gets)
        elsif j == 4
            puts "Enter Registration to unpark car"
            parking.remove_car(gets)
        elsif j == 5
            puts "Bikes"
            puts parking.available_spots[0].join(", ")
            puts "Cars"
            puts parking.available_spots[1].join(", ")
        elsif j == 6
            puts "Enter bike registration"
            puts parking.search_bike(gets)
        elsif j == 7
            puts "Enter car registration"
            puts parking.search_car(gets)
        elsif j == 0
            return(0)
        else
            puts "Bad Choice"
        end
    rescue StandardError => e
        puts "Error occured: #{e.message}"
    end
end