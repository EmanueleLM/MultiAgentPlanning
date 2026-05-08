(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    ;; packages
    package_0 package_1 package_2 package_3 package_4 package_5 - package
    ;; trucks
    truck_0 truck_1 - truck
    ;; airplanes
    airplane_0 airplane_1 - airplane
    ;; locations
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; airplanes initial locations
    (at airplane_0 location_1_0)
    (at airplane_1 location_0_0)

    ;; trucks initial locations
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)

    ;; packages initial ground locations
    (at package_0 location_1_1)
    (at package_1 location_0_1)
    (at package_2 location_1_1)
    (at package_3 location_1_0)
    (at package_4 location_1_0)
    (at package_5 location_1_1)

    ;; location -> city membership (static)
    (location_in location_0_0 city_0)
    (location_in location_0_1 city_0)
    (location_in location_0_2 city_0)
    (location_in location_1_0 city_1)
    (location_in location_1_1 city_1)
    (location_in location_1_2 city_1)
  )

  (:goal (and
    (at package_0 location_0_2)
    (at package_1 location_1_1)
    (at package_2 location_1_0)
    (at package_3 location_1_2)
    (at package_4 location_0_1)
    (at package_5 location_0_1)
  ))
)