(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    ;; trucks
    truck0 truck1 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet

    ;; crates
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9
    crate10 crate11 crate12 crate13 crate14 - crate
  )

  (:init
    ;; locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at hoist4 distributor1)
    (at hoist5 distributor2)

    ;; locations: pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at pallet4 distributor1)
    (at pallet5 distributor2)

    ;; locations: trucks
    (at truck0 distributor1)
    (at truck1 depot1)

    ;; crate place assignments (each crate is located at the place of its stack base)
    ;; depot0: none
    ;; depot1: crate1, crate5, crate10, crate12
    (at crate1 depot1)
    (at crate5 depot1)
    (at crate10 depot1)
    (at crate12 depot1)
    ;; depot2: none
    ;; distributor0: crate2, crate4
    (at crate2 distributor0)
    (at crate4 distributor0)
    ;; distributor1: crate11, crate14
    (at crate11 distributor1)
    (at crate14 distributor1)
    ;; distributor2: crate0, crate3, crate6, crate7, crate8, crate9, crate13
    (at crate0 distributor2)
    (at crate3 distributor2)
    (at crate6 distributor2)
    (at crate7 distributor2)
    (at crate8 distributor2)
    (at crate9 distributor2)
    (at crate13 distributor2)

    ;; initial on relations (stacking)
    (on crate3 crate0)
    (on crate5 crate1)
    (on crate4 crate2)
    (on crate6 crate3)
    (on crate10 crate5)
    (on crate7 crate6)
    (on crate8 crate7)
    (on crate9 crate8)
    (on crate13 crate9)
    (on crate12 crate10)
    (on crate14 crate11)
    (on crate1 pallet1)
    (on crate2 pallet3)
    (on crate11 pallet4)
    (on crate0 pallet5)

    ;; clear surfaces
    (clear crate4)
    (clear crate12)
    (clear crate13)
    (clear crate14)
    (clear pallet0)
    (clear pallet2)

    ;; hoists available
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (available hoist4)
    (available hoist5)

    ;; truck loads and limits (numeric initializations)
    (= (current-load truck0) 0)
    (= (load-limit truck0) 390)
    (= (current-load truck1) 0)
    (= (load-limit truck1) 246)

    ;; crate weights
    (= (crate-weight crate0) 41)
    (= (crate-weight crate1) 43)
    (= (crate-weight crate2) 25)
    (= (crate-weight crate3) 16)
    (= (crate-weight crate4) 5)
    (= (crate-weight crate5) 16)
    (= (crate-weight crate6) 62)
    (= (crate-weight crate7) 87)
    (= (crate-weight crate8) 30)
    (= (crate-weight crate9) 49)
    (= (crate-weight crate10) 31)
    (= (crate-weight crate11) 81)
    (= (crate-weight crate12) 4)
    (= (crate-weight crate13) 73)
    (= (crate-weight crate14) 31)

    ;; fuel cost starts at 0
    (= (fuel-cost) 0)
  )

  ;; goal stacking relations (as specified)
  (:goal (and
    (on crate2 crate0)
    (on crate6 crate2)
    (on crate3 crate9)
    (on crate14 crate10)
    (on crate1 crate12)
    (on crate10 crate13)
    (on crate5 pallet0)
    (on crate13 pallet1)
    (on crate9 pallet2)
    (on crate0 pallet4)
    (on crate12 pallet5)
  ))

  (:metric minimize (fuel-cost))
)