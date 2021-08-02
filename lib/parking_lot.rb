require_relative './parking_zone.rb'

class ParkingLot
    def initialize(bike_parking = ParkingZone.new('B'), car_parking = ParkingZone.new('C'))
        @bike_parking = bike_parking
        @car_parking = car_parking
    end

    def park_bike(reg)
        @bike_parking.park(reg)
    end

    def park_car(reg)
        @car_parking.park(reg)
    end

    def remove_bike(reg)
        @bike_parking.remove(reg)
    end

    def remove_car(reg)
        @car_parking.remove(reg)
    end

    def search_bike(reg)
        @bike_parking.search(reg)
    end

    def search_car(reg)
        @car_parking.search(reg)
    end

    def available_spots
        [@bike_parking.available_spots, @car_parking.available_spots]
    end
end