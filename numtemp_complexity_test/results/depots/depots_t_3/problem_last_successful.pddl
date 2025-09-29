(define (problem multi-agent-warehouse-problem)
  (:domain multi-agent-warehouse)

  (:objects
    depot0 distributor0 distributor1 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 - hoist
    pallet0 pallet1 pallet2 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 - crate
  )

  (:init
    ;; object locations (consistent identifiers)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate4 depot0)
    (at crate7 depot0)
    (at hoist0 depot0)
    (at pallet0 depot0)

    (at crate2 distributor0)
    (at hoist1 distributor0)
    (at pallet1 distributor0)

    (at crate3 distributor1)
    (at crate5 distributor1)
    (at crate6 distributor1)
    (at hoist2 distributor1)
    (at pallet2 distributor1)
    (at truck0 distributor1)
    (at truck1 distributor1)

    ;; on relations (stack bottoms to tops)
    (on crate1 crate0)
    (on crate4 crate1)
    (on crate5 crate3)
    (on crate7 crate4)
    (on crate6 crate5)
    (on crate0 pallet0)
    (on crate2 pallet1)
    (on crate3 pallet2)

    ;; clear surfaces (tops of stacks)
    (clear crate2)
    (clear crate6)
    (clear crate7)

    ;; hoists empty
    (empty hoist0)
    (empty hoist1)
    (empty hoist2)

    ;; numeric initializations
    (= (total-time) 0)

    ;; distances
    (= (distance depot0 depot0) 0)
    (= (distance depot0 distributor0) 5)
    (= (distance depot0 distributor1) 4)
    (= (distance distributor0 depot0) 6)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 10)
    (= (distance distributor1 depot0) 5)
    (= (distance distributor1 distributor0) 2)
    (= (distance distributor1 distributor1) 0)

    ;; truck speeds
    (= (speed truck0) 4)
    (= (speed truck1) 5)

    ;; hoist powers
    (= (power hoist0) 3)
    (= (power hoist1) 7)
    (= (power hoist2) 9)

    ;; crate weights
    (= (weight crate0) 6)
    (= (weight crate1) 22)
    (= (weight crate2) 23)
    (= (weight crate3) 87)
    (= (weight crate4) 89)
    (= (weight crate5) 50)
    (= (weight crate6) 18)
    (= (weight crate7) 93)

    ;; trucks initially stationary
    (stationary truck0)
    (stationary truck1)
  )

  (:goal (and
    (on crate0 crate4)
    (on crate2 crate6)
    (on crate4 crate7)
    (on crate7 pallet0)
    (on crate6 pallet1)
    (on crate5 pallet2)
  ))

  (:metric minimize (total-time))
)