(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    depot0 distributor0 distributor1 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 - hoist
    pallet0 pallet1 pallet2 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate
  )

  (:init
    ;; places of objects (from initial_locations)
    (at pallet0 depot0)
    (at crate1 depot0)
    (at crate6 depot0)
    (at crate11 depot0)
    (at hoist0 depot0)
    (at truck1 depot0)

    (at pallet1 distributor0)
    (at crate3 distributor0)
    (at crate4 distributor0)
    (at crate7 distributor0)
    (at crate8 distributor0)
    (at crate9 distributor0)
    (at crate12 distributor0)
    (at crate13 distributor0)
    (at crate14 distributor0)
    (at hoist1 distributor0)

    (at pallet2 distributor1)
    (at crate0 distributor1)
    (at crate2 distributor1)
    (at crate5 distributor1)
    (at crate10 distributor1)
    (at hoist2 distributor1)
    (at truck0 distributor1)

    ;; on relations (stacks)
    (on crate2 crate0)
    (on crate6 crate1)
    (on crate5 crate2)
    (on crate4 crate3)
    (on crate7 crate4)
    (on crate10 crate5)
    (on crate11 crate6)
    (on crate8 crate7)
    (on crate9 crate8)
    (on crate12 crate9)
    (on crate13 crate12)
    (on crate14 crate13)
    (on crate1 pallet0)
    (on crate3 pallet1)
    (on crate0 pallet2)

    ;; clear surfaces
    (clear crate10)
    (clear crate11)
    (clear crate14)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)

    ;; numeric fluents: speeds
    (= (speed truck0) 8)
    (= (speed truck1) 6)

    ;; hoist powers
    (= (power hoist0) 3)
    (= (power hoist1) 7)
    (= (power hoist2) 10)

    ;; crate weights
    (= (weight crate0) 89)
    (= (weight crate1) 62)
    (= (weight crate2) 42)
    (= (weight crate3) 37)
    (= (weight crate4) 11)
    (= (weight crate5) 91)
    (= (weight crate6) 58)
    (= (weight crate7) 58)
    (= (weight crate8) 20)
    (= (weight crate9) 15)
    (= (weight crate10) 95)
    (= (weight crate11) 75)
    (= (weight crate12) 53)
    (= (weight crate13) 73)
    (= (weight crate14) 70)

    ;; distances (as given, possibly asymmetric)
    (= (distance depot0 depot0) 0)
    (= (distance depot0 distributor0) 4)
    (= (distance depot0 distributor1) 3)

    (= (distance distributor0 depot0) 6)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 10)

    (= (distance distributor1 depot0) 5)
    (= (distance distributor1 distributor0) 7)
    (= (distance distributor1 distributor1) 0)

    ;; initial total time
    (= (total-time) 0)
  )

  (:goal (and
    (on crate5 crate0)
    (on crate2 crate1)
    (on crate10 crate4)
    (on crate11 crate5)
    (on crate0 crate8)
    (on crate1 crate9)
    (on crate4 crate11)
    (on crate3 crate12)
    (on crate8 pallet0)
    (on crate9 pallet1)
    (on crate12 pallet2)
  ))
  (:metric minimize (total-time))
)