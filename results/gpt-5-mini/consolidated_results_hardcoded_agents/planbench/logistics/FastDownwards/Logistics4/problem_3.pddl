(define (problem move-package-0-to-location_1_1)
  (:domain multi-transport)

  (:objects
    ; cities (included for completeness)
    city_0 city_1 - city

    ; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ; package
    package_0 - package

    ; discrete stages (explicit time steps). Provide a linear chain of stages.
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 - stage
  )

  (:init
    ; initial vehicle and package locations
    (at-airplane airplane_0 location_1_0)
    (at-pkg package_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    ; airport facts (one airport per city as specified)
    (airport location_0_0)
    (airport location_1_0)

    ; same-city relations (explicit and symmetric within each city)
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    (same-city location_0_0 location_0_0)
    (same-city location_0_1 location_0_1)

    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)
    (same-city location_1_0 location_1_0)
    (same-city location_1_1 location_1_1)

    ; linear stage ordering (static). Each action must consume the current stage and move to its successor.
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)

    ; start at stage_0
    (current stage_0)
  )

  (:goal
    (and
      ; terminal condition: package_0 at location_1_1
      (at-pkg package_0 location_1_1)
    )
  )
)