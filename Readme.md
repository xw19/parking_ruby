# Parking Lot

## Problem
Design a simple parking lot


## Solution
We can use array to store the status of the parking lot. We just need to keep track of where are the empty spaces. 
Implemetation Time complexity O(n) and Space O(n)

## Parking Array
Stores the data and not meant to be directly used

## Parking zone
Uses parking lot to keep user understandable data

## How to run

```bash
    ./main.rb
```

## Tests
uses Mini tests

```bash
    ruby -Ilib:test tests/test_parking_array.rb
    ruby -Ilib:test tests/test_parking_zone.rb
```