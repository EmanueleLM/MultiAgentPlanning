(define (problem jack_of_all_trades_instance)
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

    ;; location -> city assignments
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)

    ;; static truck -> city mapping (one truck per city as per instance)
    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)
    (truck_in_city truck_2 city_2)

    ;; initial dynamic state
    (at_plane airplane_0 location_2_0)
    (at_package package_0 location_0_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
    (at_truck truck_2 location_2_0)
  )
  (:goal (and
    (at_package package_0 location_1_0)
  ))
)