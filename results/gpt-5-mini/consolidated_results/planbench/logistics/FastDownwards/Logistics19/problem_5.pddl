(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 - package
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    stage_0 stage_1 stage_2 stage_3 stage_4 - stage
  )

  (:init
    ;; Initial vehicle & package locations
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_2)
    (airplane_at airplane_0 location_0_0)
    (package_at package_0 location_1_0)

    ;; Airport markers
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; same_city relations (symmetric) for locations in each city
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

    ;; Stage successor chain
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)

    ;; Starting stage
    (current_stage stage_0)
  )

  (:goal
    (and
      (package_at package_0 location_1_1)
    )
  )
)