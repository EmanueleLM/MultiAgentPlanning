(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_domain)

  (:objects
    ;; locations
    location_0_0 location_1_0 location_2_0 - location
    ;; cities
    city_0 city_1 city_2 - city
    ;; trucks
    truck_0 truck_1 truck_2 - truck
    ;; airplanes
    airplane_0 - airplane
    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; location to city mapping
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)

    ;; initial locations of vehicles and packages
    (at airplane_0 location_1_0)
    (at package_0 location_1_0)
    (at package_1 location_2_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at truck_2 location_2_0)
  )

  (:goal (and
    (at package_0 location_2_0)
    (at package_1 location_0_0)
  ))
)