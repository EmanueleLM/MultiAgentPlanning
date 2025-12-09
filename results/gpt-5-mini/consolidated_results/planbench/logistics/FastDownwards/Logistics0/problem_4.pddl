(define (problem Logistics0-problem)
  (:domain Logistics0)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 - package
    location_0_0 location_1_0 - location
    city_0 city_1 - city
    stage_0 stage_1 stage_2 stage_3 - stage
  )

  (:init
    ;; Airports and city membership
    (airport location_0_0)
    (airport location_1_0)
    (location-in-city location_0_0 city_0)
    (location-in-city location_1_0 city_1)

    ;; Initial positions
    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_1_0)
    (at-package package_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    ;; Air routes (explicit, bidirectional)
    (air-route location_1_0 location_0_0)
    (air-route location_0_0 location_1_0)

    ;; Explicit stage ordering: actions must advance stages contiguously
    (successor stage_0 stage_1)
    (successor stage_1 stage_2)
    (successor stage_2 stage_3)

    ;; Initial current stage (unique)
    (current-stage stage_0)
  )

  (:goal
    (and
      ;; Terminal condition: package_0 must be at location_0_0
      (at-package package_0 location_0_0)
      ;; And the plan must have advanced to the final stage exactly
      (current-stage stage_3)
    )
  )
)