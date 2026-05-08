(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    package_0 package_1 package_2 package_3 package_4 package_5 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )
  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; airplanes at locations
    (airplane_at airplane_0 location_1_0)
    (airplane_at airplane_1 location_0_0)

    ;; packages at locations
    (package_at package_0 location_1_1)
    (package_at package_1 location_0_1)
    (package_at package_2 location_1_1)
    (package_at package_3 location_1_0)
    (package_at package_4 location_1_0)
    (package_at package_5 location_1_1)

    ;; trucks at locations
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_0)

    ;; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)
  )
  (:goal (and
    (package_at package_0 location_0_2)
    (package_at package_1 location_1_1)
    (package_at package_2 location_1_0)
    (package_at package_3 location_1_2)
    (package_at package_4 location_0_1)
    (package_at package_5 location_0_1)
  ))
)