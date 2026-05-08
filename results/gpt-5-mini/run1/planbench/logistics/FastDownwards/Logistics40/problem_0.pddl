(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 package_2 package_3 package_4 package_5 - package
  )

  (:init
    ;; Airports (static)
    (airport location_0_0)
    (airport location_1_0)

    ;; Location -> city membership (static)
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_0_2 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)
    (location_in_city location_1_2 city_1)

    ;; Airplanes initial locations
    (at_airplane airplane_0 location_1_0)
    (at_airplane airplane_1 location_0_0)

    ;; Trucks initial locations
    (at_truck truck_0 location_0_2)
    (at_truck truck_1 location_1_2)

    ;; Packages initial at-locations
    (at_package package_0 location_0_0)
    (at_package package_1 location_0_2)
    (at_package package_2 location_1_0)
    (at_package package_3 location_0_0)
    (at_package package_4 location_1_2)
    (at_package package_5 location_1_1)
  )

  (:goal (and
    (at_package package_0 location_0_2)
    (at_package package_1 location_1_0)
    (at_package package_2 location_1_2)
    (at_package package_3 location_1_1)
    (at_package package_4 location_1_0)
    (at_package package_5 location_1_2)
  ))
)