(define (problem logistics24)
  (:domain logistics)

  (:objects
    package_0 package_1 package_2 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  (:init
    ;; city membership of locations (as provided)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; airports (as provided)
    (airport location_0_0)
    (airport location_1_0)

    ;; initial positions of vehicles (as provided)
    (at airplane_0 location_1_0)
    (at truck_0 location_0_2)
    (at truck_1 location_1_2)

    ;; initial positions of packages (as provided)
    (at package_0 location_1_2)
    (at package_1 location_0_1)
    (at package_2 location_1_1)
  )

  (:goal (and
    (at package_0 location_1_0)
    (at package_1 location_1_0)
    (at package_2 location_1_2)
  ))
)