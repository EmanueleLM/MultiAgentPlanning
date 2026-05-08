(define (problem port-transfer-instance)
  (:domain port-transfer)

  ;; Objects
  (:objects
    driver1 - driver
    hoist1 - hoist-operator
    lift1 - lift-operator
    truck1 - truck
    c1 - container
    depot quay ship - location
    phase1_load phase2_drive phase3_lift phase4_complete - phase
  )

  ;; Initial state: all facts necessary to enforce the exact sequence
  (:init
    ;; positions
    (at-agent driver1 depot)
    (at-agent hoist1 depot)
    (at-agent lift1 quay)

    (at-truck truck1 depot)

    ;; container initially at depot
    (container-at c1 depot)

    ;; truck empty and operators free
    (truck-empty truck1)
    (operator-free hoist1)
    (operator-free lift1)

    ;; start at phase1 (load)
    (current-phase phase1_load)
  )

  ;; Goal: container placed on ship, phase sequence completed and truck at quay with driver
  ;; Fixes mandated terminal conditions: container location, final phase, truck & driver positions.
  (:goal (and
    (container-at c1 ship)
    (current-phase phase4_complete)
    (at-truck truck1 quay)
    (at-agent driver1 quay)
  ))
)