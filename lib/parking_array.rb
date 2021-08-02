require_relative './constants.rb'

class ParkingArray
    include Constants

    attr_reader :spots
    
    def initialize(max_spots=5)
        raise Exception(LESS_THAN_ONE_SPOT) if max_spots < 1
        @spots = Array.new(max_spots, EMPTY)
        @max_spots = max_spots
    end

    def park(car_reg='')
        raise StandardError.new(EMPTY_CAR_REGISTRATION) if car_reg.empty?
        car_reg_upcased = car_reg.upcase()
        @spots.each_with_index do |val, index|
           if val.empty?
                @spots[index] = car_reg_upcased
                return index
           elsif val.eql?(car_reg_upcased)
                raise StandardError.new("#{DUPLICATE_REGISTRATION}: #{car_reg}")
            end
        end
        raise StandardError.new(NO_SPACE_AVAILABLE)
    end

    def remove(car_reg='')
        index = search(car_reg)
        empty_spot(index)
    end

    def parked_info(spot)
        @spots[spot]
    end

    def available_spots
        available = []
        @spots.each_with_index do |val, index|
            available << index if val.empty?
        end
        available
    end

    def empty_spot(index)
        @spots[index] = EMPTY
        index
    end

    def search(car_reg='')
        car_reg_upcased = car_reg.upcase()
        @spots.each_with_index do |val, index|
            if val.eql?(car_reg_upcased)
                return index
            end
        end
        raise StandardError.new(NOT_FOUND)
    end
end