(define (problem logistics48_instance)
  (:domain logistics48)
  (:objects
    city_0 city_1 city_2 - city
    location_0_0 location_1_0 location_2_0 - location
    truck_0 truck_1 truck_2 - truck
    airplane_0 - airplane
    package_0 package_1 - package
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)
    (airport location_2_0)

    ;; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)
    (in_city location_2_0 city_2)

    ;; initial vehicle positions
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_0)
    (truck_at truck_2 location_2_0)

    (airplane_at airplane_0 location_1_0)

    ;; package initial locations
    (package_at package_0 location_2_0)
    (package_at package_1 location_1_0)
  )

  (:goal (and
    (package_at package_0 location_2_0)
    (package_at package_1 location_2_0)
  ))
)