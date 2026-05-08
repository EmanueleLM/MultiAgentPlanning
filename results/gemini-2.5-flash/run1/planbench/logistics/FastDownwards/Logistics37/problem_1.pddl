(define (problem logistics37-problem)
  (:domain logistics37)
  (:objects
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
    airplane_0 - airplane
    package_0 package_1 package_2 package_3 package_4 package_5 - package
    truck_0 truck_1 - truck
  )

  (:init
    (is_airport location_0_0)
    (is_airport location_1_0)

    (at airplane_0 location_0_0)

    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_1_2)
    (at package_3 location_1_1)
    (at package_4 location_0_1)
    (at package_5 location_0_1)

    (at truck_0 location_0_0)
    (at truck_1 location_1_1)

    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)
  )

  (:goal (and
    (at package_0 location_0_0)
    (at package_1 location_1_1)
    (at package_2 location_0_2)
    (at package_3 location_0_0)
    (at package_4 location_1_0)
    (at package_5 location_0_1)
  ))
)