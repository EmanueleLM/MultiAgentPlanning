(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    ;; trucks
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 - package

    ;; locations (airports are marked via predicate in init)
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ;; cities
    city_0 city_1 - city

    ;; discrete stage/time tokens (chain bounds plan length)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19 - stage
  )

  (:init
    ;; Stage chain and initial stage token
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
    (at-stage stage_0)

    ;; City membership of locations
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; Airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; Air routes between airports (both directions explicit)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)

    ;; Initial positions of trucks and airplanes
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)
    (at-plane airplane_0 location_0_0)
    (at-plane airplane_1 location_1_0)

    ;; Initial package locations (not contained in any vehicle at start)
    (at-package package_0 location_1_2)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_2)
  )

  (:goal (and
    (at-package package_0 location_1_1)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_0)
  ))
)