(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    depot0 distributor0 distributor1 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 - hoist
    pallet0 pallet1 pallet2 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - crate
  )

  (:init
    (= (speed truck0) 7)
    (= (speed truck1) 3)

    (= (power hoist0) 1)
    (= (power hoist1) 2)
    (= (power hoist2) 2)

    (= (weight crate0) 87)
    (= (weight crate1) 69)
    (= (weight crate2) 18)
    (= (weight crate3) 76)
    (= (weight crate4) 44)
    (= (weight crate5) 96)
    (= (weight crate6) 15)
    (= (weight crate7) 99)
    (= (weight crate8) 57)
    (= (weight crate9) 6)

    (= (distance depot0 depot0) 0)
    (= (distance depot0 distributor0) 7)
    (= (distance depot0 distributor1) 3)

    (= (distance distributor0 depot0) 10)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 2)

    (= (distance distributor1 depot0) 6)
    (= (distance distributor1 distributor0) 1)
    (= (distance distributor1 distributor1) 0)

    (at-pos truck0 depot0)
    (at-pos truck1 distributor0)

    (hoist-at hoist0 depot0)
    (hoist-at hoist1 distributor0)
    (hoist-at hoist2 distributor1)

    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)

    (at-pos pallet0 depot0)
    (at-pos crate1 depot0)
    (at-pos crate3 depot0)
    (at-pos crate4 depot0)

    (at-pos pallet1 distributor0)
    (at-pos crate6 distributor0)
    (at-pos crate7 distributor0)
    (at-pos crate8 distributor0)

    (at-pos pallet2 distributor1)
    (at-pos crate0 distributor1)
    (at-pos crate2 distributor1)
    (at-pos crate5 distributor1)
    (at-pos crate9 distributor1)

    (on crate2 crate0)
    (on crate3 crate1)
    (on crate5 crate2)
    (on crate4 crate3)
    (on crate9 crate5)
    (on crate7 crate6)
    (on crate8 crate7)
    (on crate1 pallet0)
    (on crate6 pallet1)
    (on crate0 pallet2)

    (clear crate4)
    (clear crate8)
    (clear crate9)
  )

  (:goal (and
    (on crate2 crate0)
    (on crate7 crate1)
    (on crate8 crate3)
    (on crate5 crate4)
    (on crate0 crate5)
    (on crate4 crate6)
    (on crate6 crate9)
    (on crate9 pallet0)
    (on crate1 pallet1)
    (on crate3 pallet2)
  ))

  (:metric minimize (total-time))
)