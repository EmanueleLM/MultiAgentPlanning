(define (problem logistics17-prob)
  (:domain logistics17)
  (:objects
    ; packages
    package_0 package_1 package_2 package_3 - package
    ; trucks (one per city)
    truck_0 truck_1 - truck
    ; airplanes (only the single airplane required)
    airplane_0 - airplane
    ; locations (typed to encode city-membership and airports)
    location_0_0 - airport0
    location_0_1 - loc0
    location_1_0 - airport1
    location_1_1 - loc1
  )

  (:init
    ; airplane initial location
    (at-airplane airplane_0 location_1_0)

    ; package initial locations
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_0)
    (at-package package_3 location_1_1)

    ; truck initial locations
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)
  )

  (:goal (and
    (at-package package_0 location_0_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_0_1)
    (at-package package_3 location_1_1)
  ))
)