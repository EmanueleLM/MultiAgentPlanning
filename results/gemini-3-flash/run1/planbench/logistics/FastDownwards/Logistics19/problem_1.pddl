(define (problem logistics_19)
  (:domain logistics)
  (:objects
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
  )

  (:init
    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Locations in City 0
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)

    ;; Locations in City 1
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ;; Initial positions
    (at airplane_0 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_2)
    (at package_0 location_1_0)
  )

  (:goal (at package_0 location_1_1))
)