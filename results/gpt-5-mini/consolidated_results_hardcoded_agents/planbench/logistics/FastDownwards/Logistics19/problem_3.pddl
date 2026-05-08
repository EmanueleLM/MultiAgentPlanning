(define (problem transport_problem)
  (:domain transport_domain)

  ; Assumptions encoded in :init:
  ; - Airport locations are marked with (is_airport ...)
  ; - same_city facts are provided extensionally and are symmetric entries.
  ; - A bounded stage horizon is provided; each action consumes exactly one stage transition.
  ; - No numeric capacities or durations beyond the step ordering are modeled.

  (:objects
    ;; trucks
    truck_0 truck_1 - truck
    ;; airplane
    airplane_0 - airplane
    ;; package
    package_0 - package
    ;; cities (named for clarity; city objects are not directly used by predicates here)
    city_0 city_1 - city
    ;; locations (airports are simply marked via is_airport)
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ;; explicit discrete stages to enforce ordering (horizon)
    stage_0 stage_1 stage_2 stage_3 stage_4 - stage
  )

  (:init
    ;; Initial vehicle & package locations (from human specification)
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_2)
    (airplane_at airplane_0 location_0_0)
    (package_at package_0 location_1_0)

    ;; Mark airport locations
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; City membership encoded via same_city relation (symmetric entries)
    ;; city_0: location_0_0, location_0_1, location_0_2
    (same_city location_0_0 location_0_1)
    (same_city location_0_1 location_0_0)
    (same_city location_0_0 location_0_2)
    (same_city location_0_2 location_0_0)
    (same_city location_0_1 location_0_2)
    (same_city location_0_2 location_0_1)

    ;; city_1: location_1_0, location_1_1, location_1_2
    (same_city location_1_0 location_1_1)
    (same_city location_1_1 location_1_0)
    (same_city location_1_0 location_1_2)
    (same_city location_1_2 location_1_0)
    (same_city location_1_1 location_1_2)
    (same_city location_1_2 location_1_1)

    ;; Stage successor (strict ordering). Each action must consume one successor step.
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)

    ;; starting stage
    (current_stage stage_0)
  )

  (:goal
    (and
      (package_at package_0 location_1_1)
    )
  )
)