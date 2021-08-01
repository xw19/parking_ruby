#!/usr/bin/env ruby

require_relative "./lib/parking_zone.rb"
require_relative "./lib/parking_array.rb"

puts "Enter capacity of Parking Lot"
max_capacity = gets.to_i

array = ParkingArray.new(max_capacity)
parking = ParkingZone.new('P', array)

while true do
    puts "Enter 1 to Park, 2 to Remove, 3 to print status, any other number to exit"
    j = gets.to_i
    begin
        if j == 1
            puts "Enter Registration number to park"
            parking.park(gets)
        elsif j == 2
            puts "Enter Registration to unpark"
            parking.remove(gets)
        elsif j == 3
            puts parking
            puts parking.spots
        else
            return(0)
        end
    rescue StandardError => e
        puts "Error occured: #{e.message}"
    end
end