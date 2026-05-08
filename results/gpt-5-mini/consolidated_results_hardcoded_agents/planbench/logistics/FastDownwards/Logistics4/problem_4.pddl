(define (problem move-package-0-to-location_1_1)
  (:domain multi-transport)

  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 - package
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 - stage
  )

  (:init
    (at-airplane airplane_0 location_1_0)
    (at-pkg package_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)
    (airport location_0_0)
    (airport location_1_0)

    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    (same-city location_0_0 location_0_0)
    (same-city location_0_1 location_0_1)

    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)
    (same-city location_1_0 location_1_0)
    (same-city location_1_1 location_1_1)

    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)

    (current stage_0)
  )

  (:goal
    (and
      (at-pkg package_0 location_1_1)
    )
  )
)