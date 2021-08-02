require_relative './parking_array.rb'


class ParkingZone
    def initialize(zone_name = 'A', parking = ParkingArray.new(), separator = '-')
        @parking = parking
        @seprator = separator
        @zone_name = zone_name
    end

    def to_s
        "<ParkingZone name: #{@zone_name}, space: #{@parking.spots.length}, available: #{available_spots} >"
    end

    def park(car_reg='')
        index = @parking.park(car_reg)
        spot_number(index+1)
    end

    def spots
        @parking.spots
    end

    def remove(car_reg='')
        index = @parking.remove(car_reg)
        spot_number(index+1)
    end

    def spot_number(index)
        "#{@zone_name}#{@seprator}#{index}"
    end

    def available_spots
        @parking.available_spots.map { |v| spot_number(v+1) }
    end

    def empty_spot(spot)
        arr = spot.split(@seprator)
        @parking.empty_spot(arr[1].to_i-1)
    end

    def search(car_reg='')
        index = @parking.search(car_reg)
        spot_number(index+1)
    end
end