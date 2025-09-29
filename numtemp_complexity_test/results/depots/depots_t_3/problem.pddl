(define (problem multi-agent-warehouse-problem)
  (:domain multi-agent-warehouse)

  (:objects
    depot0 distributor0 distributor1 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 - hoist
    pallet0 pallet1 pallet2 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 - crate
  )

  (:init
    ;; object locations consistent with human specification
    (at crate1 depot0)
    (at hoist0 depot0)
    (at pallet0 depot0)
    (at truck0 depot0)

    (at crate0 distributor0)
    (at crate3 distributor0)
    (at crate4 distributor0)
    (at hoist1 distributor0)
    (at pallet1 distributor0)
    (at truck1 distributor0)

    (at crate2 distributor1)
    (at crate5 distributor1)
    (at hoist2 distributor1)
    (at pallet2 distributor1)

    ;; stacks as specified (bottom -> ... -> top)
    (on crate1 pallet0)
    (on crate0 pallet1)
    (on crate3 crate0)
    (on crate4 crate3)
    (on crate2 pallet2)
    (on crate5 crate2)

    ;; clear surfaces (tops of stacks)
    (clear crate1)
    (clear crate4)
    (clear crate5)

    ;; hoists empty
    (empty hoist0)
    (empty hoist1)
    (empty hoist2)

    ;; numeric initializations
    (= (total-time) 0)

    ;; distances (directed) as in specification
    (= (distance depot0 depot0) 0)
    (= (distance depot0 distributor0) 3)
    (= (distance depot0 distributor1) 6)
    (= (distance distributor0 depot0) 9)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 3)
    (= (distance distributor1 depot0) 1)
    (= (distance distributor1 distributor0) 9)
    (= (distance distributor1 distributor1) 0)

    ;; truck speeds
    (= (speed truck0) 8)
    (= (speed truck1) 8)

    ;; hoist powers
    (= (power hoist0) 4)
    (= (power hoist1) 5)
    (= (power hoist2) 6)

    ;; crate weights
    (= (weight crate0) 99)
    (= (weight crate1) 89)
    (= (weight crate2) 67)
    (= (weight crate3) 81)
    (= (weight crate4) 4)
    (= (weight crate5) 50)

    ;; trucks initially stationary
    (stationary truck0)
    (stationary truck1)
  )

  (:goal (and
    (on crate5 crate0)
    (on crate0 crate1)
    (on crate3 crate2)
    (on crate2 pallet0)
    (on crate4 pallet1)
    (on crate1 pallet2)
  ))

  (:metric minimize (total-time))
)