(define (problem logistics1_problem)
  (:domain logistics1)
  (:objects
    package_0 package_1 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_1_0 - location
    city_0 city_1 - city
  )

  (:init
    ; Location properties
    (is-airport location_0_0)
    (in-city location_0_0 city_0)
    (is-airport location_1_0)
    (in-city location_1_0 city_1)

    ; Initial positions of objects
    (at airplane_0 location_1_0)
    (at package_0 location_1_0)
    (at package_1 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
  )

  (:goal
    (and
      (at package_0 location_1_0)
      (at package_1 location_1_0)
    )
  )
)