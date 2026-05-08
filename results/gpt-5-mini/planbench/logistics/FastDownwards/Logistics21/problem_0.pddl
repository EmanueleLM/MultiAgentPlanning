(define (problem orchestrator_transport_problem)
  (:domain orchestrator_transport)

  (:objects
    ;; packages
    package_0 package_1 - package

    ;; vehicles (distinct agents)
    truck_0 - truck
    plane_0 - plane

    ;; locations: two airports and one regular road location plus a remote airport
    location_0_0 - airport
    location_0_2 - airport
    location_1_0 - airport
    location_0_1 - location
  )

  ;; initial state
  (:init
    ;; initial package locations
    (at package_0 location_0_0)
    (at package_1 location_0_2)

    ;; vehicles initial locations
    (at truck_0 location_0_1)
    (at plane_0 location_1_0)

    ;; road connectivity (two-way)
    (road location_0_0 location_0_1)
    (road location_0_1 location_0_0)
    (road location_0_1 location_0_2)
    (road location_0_2 location_0_1)

    ;; air connectivity between airports (bidirectional)
    (air location_1_0 location_0_2)
    (air location_0_2 location_1_0)
    (air location_1_0 location_0_0)
    (air location_0_0 location_1_0)
    (air location_0_0 location_0_2)
    (air location_0_2 location_0_0)
  )

  ;; goal conditions: enforce final locations explicitly
  (:goal (and
    (at package_0 location_0_2)
    (at package_1 location_0_0)
  ))
)