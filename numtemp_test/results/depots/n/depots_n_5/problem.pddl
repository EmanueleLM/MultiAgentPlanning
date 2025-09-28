(define (problem trucks-hoists-crates-problem)
  (:domain trucks-hoists-crates)

  (:objects
    depot0 - place
    distributor0 distributor1 - place

    truck0 truck1 hoist0 hoist1 hoist2
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14
    - object
  )

  (:init
    (at hoist0 depot0)
    (at hoist1 distributor0)
    (at hoist2 distributor1)

    (at pallet0 depot0)
    (at pallet5 depot0)

    (at crate1 depot0)
    (at crate2 depot0)
    (at crate8 depot0)

    (at pallet1 distributor0)
    (at pallet4 distributor0)
    (at truck0 distributor0)
    (at truck1 distributor0)

    (at crate3 distributor0)
    (at crate6 distributor0)
    (at crate7 distributor0)
    (at crate9 distributor0)
    (at crate11 distributor0)
    (at crate12 distributor0)
    (at crate14 distributor0)

    (at pallet2 distributor1)
    (at pallet3 distributor1)

    (at crate0 distributor1)
    (at crate4 distributor1)
    (at crate5 distributor1)
    (at crate10 distributor1)
    (at crate13 distributor1)

    (on crate4 crate0)
    (on crate2 crate1)
    (on crate6 crate3)
    (on crate13 crate4)
    (on crate10 crate5)
    (on crate7 crate6)
    (on crate9 crate7)
    (on crate14 crate9)
    (on crate12 crate11)
    (on crate1 pallet0)
    (on crate3 pallet1)
    (on crate0 pallet2)
    (on crate5 pallet3)
    (on crate11 pallet4)
    (on crate8 pallet5)

    (available hoist0)
    (available hoist1)
    (available hoist2)

    (clear crate2)
    (clear crate8)
    (clear crate10)
    (clear crate12)
    (clear crate13)
    (clear crate14)

    (= (current-load truck0) 0)
    (= (load-limit truck0) 314)
    (= (current-load truck1) 0)
    (= (load-limit truck1) 246)

    (= (crate-weight crate0) 13)
    (= (crate-weight crate1) 94)
    (= (crate-weight crate2) 45)
    (= (crate-weight crate3) 26)
    (= (crate-weight crate4) 96)
    (= (crate-weight crate5) 74)
    (= (crate-weight crate6) 68)
    (= (crate-weight crate7) 71)
    (= (crate-weight crate8) 81)
    (= (crate-weight crate9) 51)
    (= (crate-weight crate10) 94)
    (= (crate-weight crate11) 36)
    (= (crate-weight crate12) 70)
    (= (crate-weight crate13) 66)
    (= (crate-weight crate14) 55)

    (= (fuel-cost) 0)
  )

  (:goal (and
    (on crate9 crate1)
    (on crate1 crate2)
    (on crate13 crate3)
    (on crate0 crate5)
    (on crate4 crate6)
    (on crate2 crate10)
    (on crate12 crate14)
    (on crate3 pallet0)
    (on crate11 pallet1)
    (on crate10 pallet2)
    (on crate14 pallet3)
    (on crate6 pallet4)
    (on crate5 pallet5)
  ))

  (:metric minimize (fuel-cost))
)