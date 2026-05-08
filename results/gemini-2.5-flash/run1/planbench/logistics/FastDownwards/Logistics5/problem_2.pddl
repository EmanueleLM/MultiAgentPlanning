(define (problem logistics-5)
  (:domain logistics)
  (:objects
    package_0 - package
    truck_0 - truck
    truck_1 - truck
    airplane_0 - airplane
    location_0_0 - location
    location_0_1 - location
    location_1_0 - location
    location_1_1 - location
    city_0 - city
    city_1 - city
  )
  (:init
    ;; Initial Positions:
    (vehicle-at airplane_0 location_0_0)
    (package-at package_0 location_0_1)
    (vehicle-at truck_0 location_0_0)
    (vehicle-at truck_1 location_1_1)

    ;; Location Definitions:
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; City Membership:
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    ;; Initial cost
    (= (total-cost) 0)
  )
  (:goal (package-at package_0 location_1_0))
  (:metric minimize (total-cost))
)