(define (problem jack_instance)
  (:domain jack_of_all_trades)
  (:objects
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
    package_0 package_1 - package
    truck_0 truck_1 truck_2 - truck
    airplane_0 - airplane
  )
  (:init
    (is_airport location_0_0)
    (is_airport location_1_0)
    (is_airport location_2_0)
    (at_airplane airplane_0 location_1_0)
    (at_package package_0 location_2_0)
    (at_package package_1 location_1_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
    (at_truck truck_2 location_2_0)
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)
  )
  (:goal (and
    (at_package package_0 location_2_0)
    (at_package package_1 location_2_0)
  ))
)