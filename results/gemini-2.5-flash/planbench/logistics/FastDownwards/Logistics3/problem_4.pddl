(define (problem logistics-problem-logistics3)
  (:domain logistics-logistics3)
  (:objects
    package_0 package_1 - package
    airplane_0 airplane_1 - airplane
    location_0_0 location_1_0 - location
    city_0 city_1 - city
  )
  (:init
    ; Location properties
    (loc-is-airport location_0_0)
    (loc-in-city location_0_0 city_0)
    (loc-is-airport location_1_0)
    (loc-in-city location_1_0 city_1)

    ; Vehicle initial locations
    (at_vehicle airplane_0 location_0_0)
    (at_vehicle airplane_1 location_0_0)

    ; Package initial locations
    (at_package package_0 location_1_0)
    (at_package package_1 location_1_0)

    (= (total-cost) 0)
  )
  (:goal (and
    (at_package package_0 location_1_0)
    (at_package package_1 location_0_0)
  ))
  (:metric minimize (total-cost))
)