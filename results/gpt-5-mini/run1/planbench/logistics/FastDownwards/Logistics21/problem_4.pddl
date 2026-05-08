(define (problem logistics21-problem)
  (:domain logistics21)

  (:objects
    package_0 package_1 - package
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
    truck_0 truck_1 - truck
    airplane_0 - airplane
  )

  (:init
    (package_at package_0 location_1_1)
    (package_at package_1 location_1_2)

    (vehicle_at airplane_0 location_0_0)
    (vehicle_at truck_0 location_0_1)
    (vehicle_at truck_1 location_1_0)

    (airport location_0_0)
    (airport location_1_0)

    (location_in location_0_0 city_0)
    (location_in location_0_1 city_0)
    (location_in location_0_2 city_0)
    (location_in location_1_0 city_1)
    (location_in location_1_1 city_1)
    (location_in location_1_2 city_1)
  )

  (:goal (and
    (package_at package_0 location_0_2)
    (package_at package_1 location_0_0)
  ))
)