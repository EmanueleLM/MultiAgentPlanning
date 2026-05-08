(define (problem transport-problem)
  (:domain transport-domain)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 - package
    location_0_0 location_1_0 - location
    city_0 city_1 - city
    stage_0 stage_1 stage_2 stage_3 - stage
  )

  (:init
    ; airports and city membership (public information)
    (airport location_0_0)
    (airport location_1_0)
    (location-in-city location_0_0 city_0)
    (location-in-city location_1_0 city_1)

    ; initial agent and package positions (public information)
    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_1_0)
    (at-package package_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    ; air routes: airplanes operate between city airports (bidirectional)
    (air-route location_1_0 location_0_0)
    (air-route location_0_0 location_1_0)

    ; road connectivity: locations within the same city are connected.
    ; With one location per city in this instance no inter-location roads are necessary.
    ; (No road-connected facts added because no intra-city pair of distinct locations exists here.)

    ; explicit stage ordering (discrete steps). The plan must advance current-stage
    ; from stage_0 to stage_3 through successive actions. This encodes ordered stages
    ; as hard constraints (no bookkeeping tokens or post-hoc penalties).
    (successor stage_0 stage_1)
    (successor stage_1 stage_2)
    (successor stage_2 stage_3)

    ; initial current stage
    (current-stage stage_0)
  )

  (:goal
    (and
      ;; Terminal condition required by the specification:
      (at-package package_0 location_0_0)
      ;; Enforce that the plan reaches stage_3 (i.e., ordered progression of actions).
      (current-stage stage_3)
    )
  )
)