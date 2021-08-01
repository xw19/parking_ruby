require "minitest/autorun"
require_relative "../lib/parking_array.rb"

class ParkingZoneTest < Minitest::Test
    def setup
        @parking = ParkingArray.new()
    end

    def test_initial_return_should_be_empty_array
        assert_equal ["", "", "", "", ""], @parking.spots
    end

    def test_park_should_park_a_vehicle
        spot = @parking.park("xyz")
        assert_equal ["XYZ", "", "", "", ""], @parking.spots
        assert_equal spot, 0
    end

    def test_should_not_park_vehicle_with_same_registration
        @parking.park("xyz")
        err = assert_raises StandardError do
            @parking.park("xyz")
        end
        assert_equal(err.message, "Duplicate car registration: xyz")
    end

    def test_not_park_more_than_available
        @parking.park("1")
        @parking.park("2")
        @parking.park("3")
        @parking.park("4")
        @parking.park("5")
        err = assert_raises StandardError do
            @parking.park("xyz")
        end
        assert_equal(err.message, "No Space available")
    end

    def test_should_remove_parking
        @parking.park("1")
        @parking.park("2")
        @parking.park("xyz")
        @parking.park("4")
        @parking.park("5")
        @parking.remove("xyz")
        assert_equal @parking.available_spots,[2] 
    end

    def test_should_error_if_item_to_be_deleted_not_found
        err = assert_raises StandardError do
            @parking.remove("xyz")
        end
        assert_equal(err.message, "Not found in records")
    end

    def test_should_empty_spot
        @parking.park("1")
        @parking.park("xyz")
        @parking.park("2")
        @parking.park("3")
        @parking.park("4")
        @parking.empty_spot(1)

        assert_equal @parking.available_spots, [1]
    end
end