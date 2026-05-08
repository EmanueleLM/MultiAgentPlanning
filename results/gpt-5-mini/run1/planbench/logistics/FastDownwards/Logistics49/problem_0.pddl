(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_domain)

  (:objects
    package_0 package_1 - package
    truck_0 truck_1 truck_2 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; airplanes at locations
    (at_airplane airplane_0 location_1_0)
    (at_airplane airplane_1 location_2_0)

    ;; packages at locations
    (at_pkg package_0 location_2_0)
    (at_pkg package_1 location_1_0)

    ;; trucks at locations
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
    (at_truck truck_2 location_2_0)

    ;; location to city assignments
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_2_0 city_2)
  )

  (:goal (and
    (at_pkg package_0 location_2_0)
    (at_pkg package_1 location_0_0)
  ))
)