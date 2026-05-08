(define (problem logistics36-problem)
  (:domain logistics36)
  (:objects
    airplane_0 - airplane
    package_0 package_1 package_2 package_3 package_4 package_5 - package
    truck_0 truck_1 - truck
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )
  (:init
    (is-airport location_0_0)
    (is-airport location_1_0)
    (at-loc airplane_0 location_1_0)
    (at-loc package_0 location_1_1)
    (at-loc package_1 location_0_2)
    (at-loc package_2 location_0_2)
    (at-loc package_3 location_0_2)
    (at-loc package_4 location_1_2)
    (at-loc package_5 location_1_1)
    (at-loc truck_0 location_0_2)
    (at-loc truck_1 location_1_0)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)
  )
  (:goal (and
    (at-loc package_0 location_0_0)
    (at-loc package_1 location_1_0)
    (at-loc package_2 location_1_0)
    (at-loc package_3 location_0_2)
    (at-loc package_4 location_1_2)
    (at-loc package_5 location_1_0)
  ))
)