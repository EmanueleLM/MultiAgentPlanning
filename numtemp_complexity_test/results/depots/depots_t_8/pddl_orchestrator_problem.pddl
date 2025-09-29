(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    depot0 depot1 distributor0 distributor1 - place
    truck0 truck1 truck2 truck3 - truck
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 - hoist
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - crate
  )

  (:init
    ;; locations (at ...)
    ;; depot0 contents
    (at crate3 depot0)
    (at hoist0 depot0)
    (at hoist4 depot0)
    (at hoist5 depot0)
    (at hoist6 depot0)
    (at pallet0 depot0)
    (at pallet6 depot0)
    (at truck3 depot0)

    ;; depot1 contents
    (at crate4 depot1)
    (at hoist1 depot1)
    (at pallet1 depot1)
    (at truck0 depot1)
    (at truck2 depot1)

    ;; distributor0 contents
    (at crate2 distributor0)
    (at crate9 distributor0)
    (at hoist2 distributor0)
    (at pallet2 distributor0)
    (at pallet4 distributor0)

    ;; distributor1 contents
    (at crate0 distributor1)
    (at crate1 distributor1)
    (at crate5 distributor1)
    (at crate6 distributor1)
    (at crate7 distributor1)
    (at crate8 distributor1)
    (at hoist3 distributor1)
    (at hoist7 distributor1)
    (at pallet3 distributor1)
    (at pallet5 distributor1)
    (at pallet7 distributor1)
    (at truck1 distributor1)

    ;; initial on relations (stacks)
    (on pallet0 pallet0) ; pallet on itself indicates base; harmless
    (on pallet6 pallet6)
    (on pallet6 crate3) ; from stacks: pallet6 -> [pallet6, crate3] -> crate3 on pallet6
    ;; Explicit initial on structure from provided on_relations
    (on crate5 crate0)
    (on crate7 crate5)
    (on crate8 crate6)
    (on crate4 pallet1)
    (on crate9 pallet2)
    (on crate0 pallet3)
    (on crate2 pallet4)
    (on crate1 pallet5)
    (on crate3 pallet6)
    (on crate6 pallet7)

    ;; available hoists
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (available hoist4)
    (available hoist5)
    (available hoist6)
    (available hoist7)

    ;; clear surfaces (topmost items)
    (clear crate1)
    (clear crate2)
    (clear crate3)
    (clear crate4)
    (clear crate7)
    (clear crate8)
    (clear crate9)
    (clear pallet0)

    ;; numeric assignments: speeds
    (= (speed truck0) 2)
    (= (speed truck1) 2)
    (= (speed truck2) 8)
    (= (speed truck3) 5)

    ;; hoist power
    (= (power hoist0) 5)
    (= (power hoist1) 4)
    (= (power hoist2) 2)
    (= (power hoist3) 4)
    (= (power hoist4) 4)
    (= (power hoist5) 5)
    (= (power hoist6) 10)
    (= (power hoist7) 1)

    ;; crate weights
    (= (weight crate0) 92)
    (= (weight crate1) 8)
    (= (weight crate2) 65)
    (= (weight crate3) 14)
    (= (weight crate4) 3)
    (= (weight crate5) 13)
    (= (weight crate6) 33)
    (= (weight crate7) 76)
    (= (weight crate8) 31)
    (= (weight crate9) 91)

    ;; distances (directed)
    (= (dist depot0 depot0) 0)
    (= (dist depot0 depot1) 10)
    (= (dist depot0 distributor0) 1)
    (= (dist depot0 distributor1) 6)

    (= (dist depot1 depot0) 10)
    (= (dist depot1 depot1) 0)
    (= (dist depot1 distributor0) 6)
    (= (dist depot1 distributor1) 8)

    (= (dist distributor0 depot0) 3)
    (= (dist distributor0 depot1) 8)
    (= (dist distributor0 distributor0) 0)
    (= (dist distributor0 distributor1) 5)

    (= (dist distributor1 depot0) 10)
    (= (dist distributor1 depot1) 1)
    (= (dist distributor1 distributor0) 8)
    (= (dist distributor1 distributor1) 0)
  )

  (:goal (and
    (on crate7 crate3)
    (on crate3 crate8)
    (on crate4 pallet0)
    (on crate6 pallet1)
    (on crate2 pallet4)
    (on crate8 pallet6)
    (on crate1 pallet7)
  ))
  (:metric minimize (total-time))
)