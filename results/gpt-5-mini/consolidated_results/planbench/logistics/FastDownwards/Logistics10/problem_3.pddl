(define (problem logistics-instance-1)
  (:domain logistics-multiagent)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 package_2 - package
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
    ;; discrete global stages to enforce ordered action progression
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19 stage_20 - stage
  )

  (:init
    ;; city membership (static)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; airports (one per city as specified)
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; same-city (symmetric) for locations in the same city (static)
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)

    ;; different: all ordered pairs of distinct locations (static)
    (different location_0_0 location_0_1)
    (different location_0_0 location_1_0)
    (different location_0_0 location_1_1)
    (different location_0_1 location_0_0)
    (different location_0_1 location_1_0)
    (different location_0_1 location_1_1)
    (different location_1_0 location_0_0)
    (different location_1_0 location_0_1)
    (different location_1_0 location_1_1)
    (different location_1_1 location_0_0)
    (different location_1_1 location_0_1)
    (different location_1_1 location_1_0)

    ;; stage successor relation (static)
    (next stage_0 stage_1)
    (next stage_1 stage_2)
    (next stage_2 stage_3)
    (next stage_3 stage_4)
    (next stage_4 stage_5)
    (next stage_5 stage_6)
    (next stage_6 stage_7)
    (next stage_7 stage_8)
    (next stage_8 stage_9)
    (next stage_9 stage_10)
    (next stage_10 stage_11)
    (next stage_11 stage_12)
    (next stage_12 stage_13)
    (next stage_13 stage_14)
    (next stage_14 stage_15)
    (next stage_15 stage_16)
    (next stage_16 stage_17)
    (next stage_17 stage_18)
    (next stage_18 stage_19)
    (next stage_19 stage_20)

    ;; initial current stage
    (current-stage stage_0)

    ;; initial vehicle and package locations (dynamic state)
    (at-airplane airplane_0 location_0_0)

    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    (at-package package_0 location_0_0)
    (at-package package_1 location_1_1)
    (at-package package_2 location_0_1)
  )

  (:goal (and
    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_1_0)
  ))
)