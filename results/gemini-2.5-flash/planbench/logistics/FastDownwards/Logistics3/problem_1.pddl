(define (problem logistics-problem-logistics3)
  (:domain logistics-logistics3)
  (:objects
    package_0 package_1 - package
    truck_0 truck_1 - truck
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
    (at truck_0 location_0_0)
    (at airplane_0 location_0_0)
    (at airplane_1 location_0_0)

    ; Package and other vehicle initial locations
    (at truck_1 location_1_0)
    (at package_0 location_1_0)
    (at package_1 location_1_0)

    (= (total-cost) 0)
  )
  (:goal (and
    (at package_0 location_1_0)
    (at package_1 location_0_0)
  ))
  (:metric minimize (total-cost))
)