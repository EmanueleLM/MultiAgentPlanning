(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    city_0 city_1 city_2 - city
    location_0_0 location_1_0 location_2_0 - location
    airplane_0 airplane_1 airplane_2 - airplane
    truck_0 truck_1 truck_2 - truck
    package_0 - package
  )
  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; vehicle locations
    (at_airplane airplane_0 location_0_0)
    (at_airplane airplane_1 location_1_0)
    (at_airplane airplane_2 location_2_0)

    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
    (at_truck truck_2 location_2_0)

    ;; package initial location
    (at_pkg package_0 location_2_0)

    ;; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)
  )
  (:goal (and
    (at_pkg package_0 location_1_0)
  ))
)