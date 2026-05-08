(define (problem logistics26-problem)
  (:domain logistics26)
  (:objects
    package_0 package_1 package_2 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )
  (:init
    (is-airport location_0_0)
    (is-airport location_1_0)

    (at-location airplane_0 location_1_0)
    (at-location airplane_1 location_0_0)

    (at-location package_0 location_1_2)
    (at-location package_1 location_0_2)
    (at-location package_2 location_0_2)

    (at-location truck_0 location_0_1)
    (at-location truck_1 location_1_1)

    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)
  )
  (:goal (and
    (at-location package_0 location_0_0)
    (at-location package_1 location_1_1)
    (at-location package_2 location_1_2)
  ))
)