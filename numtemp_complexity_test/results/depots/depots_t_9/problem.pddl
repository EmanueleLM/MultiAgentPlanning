(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    depot0 depot1 distributor0 distributor1 - place

    truck0 truck1 truck2 truck3 - truck

    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 - hoist

    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 - pallet

    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate
  )

  (:init
    ; distances (directed)
    (= (distance depot0 depot0) 0)
    (= (distance depot0 depot1) 10)
    (= (distance depot0 distributor0) 4)
    (= (distance depot0 distributor1) 9)

    (= (distance depot1 depot0) 1)
    (= (distance depot1 depot1) 0)
    (= (distance depot1 distributor0) 2)
    (= (distance depot1 distributor1) 3)

    (= (distance distributor0 depot0) 8)
    (= (distance distributor0 depot1) 8)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 7)

    (= (distance distributor1 depot0) 9)
    (= (distance distributor1 depot1) 2)
    (= (distance distributor1 distributor0) 5)
    (= (distance distributor1 distributor1) 0)

    ; truck speeds
    (= (truck-speed truck0) 3)
    (= (truck-speed truck1) 6)
    (= (truck-speed truck2) 2)
    (= (truck-speed truck3) 9)

    ; hoist powers
    (= (hoist-power hoist0) 9)
    (= (hoist-power hoist1) 1)
    (= (hoist-power hoist2) 5)
    (= (hoist-power hoist3) 9)
    (= (hoist-power hoist4) 1)
    (= (hoist-power hoist5) 4)
    (= (hoist-power hoist6) 7)
    (= (hoist-power hoist7) 7)

    ; crate weights
    (= (crate-weight crate0) 7)
    (= (crate-weight crate1) 94)
    (= (crate-weight crate2) 46)
    (= (crate-weight crate3) 3)
    (= (crate-weight crate4) 15)
    (= (crate-weight crate5) 90)
    (= (crate-weight crate6) 58)
    (= (crate-weight crate7) 69)
    (= (crate-weight crate8) 77)
    (= (crate-weight crate9) 42)
    (= (crate-weight crate10) 38)
    (= (crate-weight crate11) 11)
    (= (crate-weight crate12) 82)
    (= (crate-weight crate13) 46)
    (= (crate-weight crate14) 88)

    ; initial total time
    (= (total-time) 0)

    ; initial locations: hoists, pallets, trucks at places
    (at hoist0 depot0)
    (at hoist5 depot0)
    (at pallet0 depot0)
    (at pallet4 depot0)
    (at truck2 depot0)

    (at hoist1 depot1)
    (at pallet1 depot1)
    (at pallet7 depot1)
    (at truck0 depot1)
    (at truck3 depot1)

    (at hoist2 distributor0)
    (at hoist4 distributor0)
    (at hoist6 distributor0)
    (at pallet2 distributor0)
    (at pallet5 distributor0)
    (at truck1 distributor0)

    (at hoist3 distributor1)
    (at hoist7 distributor1)
    (at pallet3 distributor1)
    (at pallet6 distributor1)

    ; crates on-site (all crates are at their respective places)
    (at crate0 depot0)
    (at crate4 depot0)
    (at crate7 depot0)
    (at crate13 depot0)

    (at crate1 depot1)
    (at crate5 depot1)
    (at crate11 depot1)

    (at crate2 distributor0)
    (at crate6 distributor0)
    (at crate8 distributor0)
    (at crate12 distributor0)
    (at crate14 distributor0)

    (at crate3 distributor1)
    (at crate9 distributor1)
    (at crate10 distributor1)

    ; initial on relations (stacking)
    (on crate0 pallet0)
    (on crate4 crate0)
    (on crate7 crate4)
    (on crate13 crate7)

    (on crate1 pallet1)
    (on crate11 crate1)

    (on crate2 pallet2)
    (on crate12 crate2)
    (on crate14 crate12)

    (on crate9 pallet3)
    (on crate10 crate9)

    (on crate6 pallet5)
    (on crate8 crate6)

    (on crate3 pallet6)
    (on crate5 pallet7)

    ; clear surfaces initially
    (clear crate3)
    (clear crate5)
    (clear crate8)
    (clear crate10)
    (clear crate11)
    (clear crate13)
    (clear crate14)
    (clear pallet4)

    ; hoists initially free
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)
    (hoist-free hoist4)
    (hoist-free hoist5)
    (hoist-free hoist6)
    (hoist-free hoist7)
  )

  (:goal (and
    (on crate9 crate1)
    (on crate8 crate4)
    (on crate12 crate5)
    (on crate0 crate10)
    (on crate2 crate12)
    (on crate14 pallet0)
    (on crate10 pallet1)
    (on crate5 pallet2)
    (on crate13 pallet3)
    (on crate4 pallet4)
    (on crate11 pallet5)
    (on crate1 pallet6)
    (on crate6 pallet7)
  ))

  (:metric minimize (total-time))
)