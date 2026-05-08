(define (problem logistics-instance)
  (:domain truck_airplane_logistics)

  (:objects
    city_0 city_1 - city
    location_0_0 location_1_0 - location
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 - package
  )

  (:init
    ;; airports and city membership (as stated)
    (airport location_0_0)
    (airport location_1_0)
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)

    ;; initial locations of vehicles and packages (as stated)
    (at_plane airplane_0 location_1_0)
    (at_package package_0 location_1_0)
    (at_package package_1 location_1_0)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)
  )

  (:goal
    (and
      (at_package package_0 location_0_0)
      (at_package package_1 location_0_0)
    )
  )
)