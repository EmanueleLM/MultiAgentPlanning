(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    package_0 package_1 package_2 package_3 package_4 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )
  (:init
    (airport location_0_0)
    (airport location_1_0)

    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    (at_plane airplane_0 location_0_0)
    (at_truck truck_0 location_0_1)
    (at_truck truck_1 location_1_0)

    (at_pkg package_0 location_1_0)
    (at_pkg package_1 location_0_0)
    (at_pkg package_2 location_0_1)
    (at_pkg package_3 location_0_0)
    (at_pkg package_4 location_1_2)
  )
  (:goal (and
    (at_pkg package_0 location_0_2)
    (at_pkg package_1 location_1_1)
    (at_pkg package_2 location_1_0)
    (at_pkg package_3 location_1_1)
    (at_pkg package_4 location_0_1)
  ))
)