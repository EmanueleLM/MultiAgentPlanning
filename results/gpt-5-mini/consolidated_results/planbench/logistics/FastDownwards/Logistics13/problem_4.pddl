(define (problem transport_problem)
  (:domain multi_transport)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 - package

    ;; ordered stages (discrete time steps). There are 15 actions in the validated plan, so we provide 16 stages.
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 - stage
  )

  (:init
    ;; Vehicles initial positions
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_1)
    (at-plane airplane_0 location_1_0)
    (at-plane airplane_1 location_0_0)

    ;; Packages initial locations
    (at-pkg package_0 location_1_0)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_0_0)

    ;; City membership for each location
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    ;; Each city has a designated airport location (explicit mapping)
    (city-airport city_0 location_0_0)
    (city-airport city_1 location_1_0)

    ;; Exactly one truck per city: assign trucks to their city (static)
    (truck-assigned truck_0 city_0)
    (truck-assigned truck_1 city_1)

    ;; Distinctness facts for locations (ordered pairs where locations differ)
    (distinct-loc location_0_0 location_0_1)
    (distinct-loc location_0_0 location_1_0)
    (distinct-loc location_0_0 location_1_1)
    (distinct-loc location_0_1 location_0_0)
    (distinct-loc location_0_1 location_1_0)
    (distinct-loc location_0_1 location_1_1)
    (distinct-loc location_1_0 location_0_0)
    (distinct-loc location_1_0 location_0_1)
    (distinct-loc location_1_0 location_1_1)
    (distinct-loc location_1_1 location_0_0)
    (distinct-loc location_1_1 location_0_1)
    (distinct-loc location_1_1 location_1_0)

    ;; Distinctness facts for cities (ordered pairs where cities differ)
    (distinct-city city_0 city_1)
    (distinct-city city_1 city_0)

    ;; Stage progression facts: linear chain stage_0 -> stage_1 -> ... -> stage_15
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

    ;; Initial current stage
    (stage-now stage_0)
  )

  (:goal
    (and
      (at-pkg package_0 location_0_1)
      (at-pkg package_1 location_0_1)
      (at-pkg package_2 location_0_1)
      ;; Require reaching the terminal stage to enforce ordered progression and completion.
      (stage-now stage_15)
    )
  )
)