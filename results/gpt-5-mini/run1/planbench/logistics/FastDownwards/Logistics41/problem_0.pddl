(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    package_0 - package
    airplane_0 - airplane
    truck_0 truck_1 truck_2 - truck
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; airplane location
    (at_airplane airplane_0 location_0_0)

    ;; package initial location
    (at package_0 location_0_0)

    ;; trucks initial locations
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
    (at_truck truck_2 location_2_0)

    ;; location -> city mapping (static)
    (loc_in_city location_0_0 city_0)
    (loc_in_city location_1_0 city_1)
    (loc_in_city location_2_0 city_2)
  )

  (:goal (and
    (at package_0 location_2_0)
  ))
)