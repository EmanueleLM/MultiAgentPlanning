(define (problem jack_of_all_trades_problem_instance)
  (:domain jack_of_all_trades)
  (:objects
    package_0 - package
    truck_0 truck_1 truck_2 - truck
    airplane_0 - airplane
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; location -> city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_2_0 city_2)

    ;; truck ownership per city
    (truck_of_city truck_0 city_0)
    (truck_of_city truck_1 city_1)
    (truck_of_city truck_2 city_2)

    ;; vehicle locations
    (at_plane airplane_0 location_0_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
    (at_truck truck_2 location_2_0)

    ;; package initial placement
    (at_package package_0 location_0_0)
  )

  (:goal (and
    (at_package package_0 location_2_0)
  ))
)