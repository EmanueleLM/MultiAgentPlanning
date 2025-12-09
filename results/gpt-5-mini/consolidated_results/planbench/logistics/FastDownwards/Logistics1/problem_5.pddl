(define (problem transport_problem)
  (:domain Logistics1)

  (:objects
    package_0 package_1 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_1_0 - location
    city_0 city_1 - city
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 - stage
  )

  (:init
    ;; Packages
    (package-at package_0 location_1_0)
    (package-at package_1 location_0_0)

    ;; Vehicles
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_0)
    (airplane-at airplane_0 location_1_0)

    ;; Cities and airports
    (located-in-city location_0_0 city_0)
    (located-in-city location_1_0 city_1)
    (airport location_0_0)
    (airport location_1_0)

    ;; Distinctness facts to forbid no-op moves (explicitly enumerate unequal pairs)
    (diff location_0_0 location_1_0)
    (diff location_1_0 location_0_0)

    ;; Stage progression (discrete time steps). Exactly one current-stage is true at any time and each action advances it.
    (next stage_0 stage_1)
    (next stage_1 stage_2)
    (next stage_2 stage_3)
    (next stage_3 stage_4)
    (next stage_4 stage_5)
    (current-stage stage_0)
  )

  (:goal (and
    (package-at package_0 location_1_0)
    (package-at package_1 location_1_0)
  ))
)