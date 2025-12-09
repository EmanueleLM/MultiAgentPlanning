(define (problem transport_problem)
  (:domain transport_domain)

  ;; Assumptions encoded as explicit initial facts:
  ;; - same_city pairs are provided extensionally and symmetric for locations in the same city.
  ;; - Airport locations are marked explicitly with (is_airport ...).
  ;; - A bounded stage horizon is provided; each action consumes exactly one stage transition.

  (:objects
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 - package
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    stage_0 stage_1 stage_2 stage_3 stage_4 - stage
  )

  (:init
    ;; Initial vehicle & package locations (from specification)
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_2)
    (airplane_at airplane_0 location_0_0)
    (package_at package_0 location_1_0)

    ;; Mark airport locations
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; City membership via same_city (symmetric entries)
    ;; city_0
    (same_city location_0_0 location_0_1)
    (same_city location_0_1 location_0_0)
    (same_city location_0_0 location_0_2)
    (same_city location_0_2 location_0_0)
    (same_city location_0_1 location_0_2)
    (same_city location_0_2 location_0_1)

    ;; city_1
    (same_city location_1_0 location_1_1)
    (same_city location_1_1 location_1_0)
    (same_city location_1_0 location_1_2)
    (same_city location_1_2 location_1_0)
    (same_city location_1_1 location_1_2)
    (same_city location_1_2 location_1_1)

    ;; Stage successor chain (contiguous ordering)
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