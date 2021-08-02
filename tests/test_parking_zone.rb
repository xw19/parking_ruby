require "minitest/autorun"
require_relative "../lib/parking_zone.rb"

class ParkingZoneTest < Minitest::Test
    def setup
        @parking = ParkingZone.new()
    end

    def test_initial_return_should_spots_available
        assert_equal ["A-1", "A-2", "A-3", "A-4", "A-5"], @parking.available_spots
    end

    def test_should_park
        assert_equal "A-1", @parking.park("XYZ")
    end

    def test_should_remove_parking
        @parking.park("XYZ")
        assert_equal "A-1", @parking.remove("XYZ")
    end

    def test_should_empty_spot
        @parking.park("1")
        @parking.empty_spot("A-1")
        assert_equal "", @parking.spots[0]
    end

    def test_should_search
        @parking.park("1")
        @parking.park("xyz")
        @parking.park("2")
        @parking.park("3")
        @parking.park("4")

        assert_equal "A-1", @parking.search("xyz")
    end
end