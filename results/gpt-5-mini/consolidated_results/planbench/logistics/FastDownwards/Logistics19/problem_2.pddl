(define (problem transport_problem)
  (:domain transport_domain)

  ;; Assumptions (listed here as comments and encoded concretely in :init):
  ;;  - A bounded discrete stage horizon is provided to enforce action ordering. We include
  ;;    stage_0 .. stage_4 which is sufficient for the plan that moves package_0 to location_1_1.
  ;;  - Airports are objects of type 'airport' (a subtype of location).
  ;;  - same_city and different_city are provided extensionally in :init (symmetric as needed).
  ;;  - No numeric capacities or durations beyond the step ordering are modeled; every action
  ;;    consumes exactly one stage transition (s -> s_successor).
  ;;  - All initial facts are encoded exactly as given in the human specification.

  (:objects
    ;; trucks
    truck_0 truck_1 - truck
    ;; airplane
    airplane_0 - airplane
    ;; package
    package_0 - package
    ;; cities (kept as named objects though not used in predicates here)
    city_0 city_1 - city
    ;; airports (typed as airport, a subtype of location)
    location_0_0 location_1_0 - airport
    ;; other locations (regular locations)
    location_0_1 location_0_2 location_1_1 location_1_2 - location

    ;; explicit discrete stages to enforce ordering (horizon)
    stage_0 stage_1 stage_2 stage_3 stage_4 - stage
  )

  (:init
    ;; Initial vehicle & package locations (from human specification)
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_2)
    (airplane_at airplane_0 location_0_0)
    (package_at package_0 location_1_0)

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

    ;; different_city entries for airport-to-airport flights (symmetric)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)

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