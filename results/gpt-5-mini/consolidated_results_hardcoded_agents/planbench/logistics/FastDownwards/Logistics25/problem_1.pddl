(define (problem logistics25-problem)
  (:domain logistics25)

  (:objects
    ;; trucks and airplane
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 package_1 package_2 - package

    ;; locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)

    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; initial vehicle positions
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ;; initial package positions
    (at-package package_0 location_1_2)
    (at-package package_1 location_0_2)
    (at-package package_2 location_0_2)
  )

  (:goal
    (and
      (at-package package_0 location_0_0)
      (at-package package_1 location_1_1)
      (at-package package_2 location_1_2)
    )
  )
)