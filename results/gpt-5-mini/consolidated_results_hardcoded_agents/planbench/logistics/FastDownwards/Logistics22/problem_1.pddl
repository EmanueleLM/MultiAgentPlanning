(define (problem multi_modal_problem)
  (:domain multi_modal_transport)

  (:objects
    ;; locations
    location_0_0 location_0_1 location_0_2 - location
    location_1_0 location_1_1 location_1_2 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 package_1 - package

    ;; cities
    city_0 city_1 - city

    ;; discrete stages (linear ordering). Provide enough stages to allow sequential actions.
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 - stage
  )

  (:init
    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Location -> city membership (explicit)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; Different-city facts for all cross-city location pairs (symmetric)
    (diff-city location_0_0 location_1_0)
    (diff-city location_0_0 location_1_1)
    (diff-city location_0_0 location_1_2)
    (diff-city location_0_1 location_1_0)
    (diff-city location_0_1 location_1_1)
    (diff-city location_0_1 location_1_2)
    (diff-city location_0_2 location_1_0)
    (diff-city location_0_2 location_1_1)
    (diff-city location_0_2 location_1_2)
    (diff-city location_1_0 location_0_0)
    (diff-city location_1_1 location_0_0)
    (diff-city location_1_2 location_0_0)
    (diff-city location_1_0 location_0_1)
    (diff-city location_1_1 location_0_1)
    (diff-city location_1_2 location_0_1)
    (diff-city location_1_0 location_0_2)
    (diff-city location_1_1 location_0_2)
    (diff-city location_1_2 location_0_2)

    ;; Initial vehicle positions (from the human specification)
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_2)
    (at-truck truck_1 location_1_2)

    ;; Initial package positions
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_2)

    ;; Stage ordering chain (strict successor links)
    (next stage_0 stage_1)
    (next stage_1 stage_2)
    (next stage_2 stage_3)
    (next stage_3 stage_4)
    (next stage_4 stage_5)
    (next stage_5 stage_6)
    (next stage_6 stage_7)

    ;; Initial active stage: stage_0
    (at-stage stage_0)
  )

  (:goal
    (and
      ;; Terminal spatial goals exactly as specified by the user:
      (at-package package_0 location_0_2)
      (at-package package_1 location_1_0)
    )
  )
)