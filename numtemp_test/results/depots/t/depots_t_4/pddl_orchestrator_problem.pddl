(define (problem logistics-instance)
  (:domain logistics-multiagent)

  (:objects
    ; places
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    ; trucks
    truck0 truck1 - truck

    ; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    ; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 - pallet

    ; crates
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - crate
  )

  (:init
    ;; total time zero
    (= (total-time) 0)

    ;; speeds
    (= (speed truck0) 3)
    (= (speed truck1) 2)

    ;; hoist powers
    (= (power hoist0) 1)
    (= (power hoist1) 6)
    (= (power hoist2) 6)
    (= (power hoist3) 1)
    (= (power hoist4) 5)
    (= (power hoist5) 4)

    ;; crate weights
    (= (weight crate0) 74)
    (= (weight crate1) 16)
    (= (weight crate2) 23)
    (= (weight crate3) 42)
    (= (weight crate4) 52)
    (= (weight crate5) 74)
    (= (weight crate6) 60)
    (= (weight crate7) 56)
    (= (weight crate8) 48)
    (= (weight crate9) 87)

    ;; initial locations (from given initial_locations)
    (at hoist0 depot0)
    (at pallet0 depot0)
    (at pallet9 depot0)
    (at crate1 depot0)
    (at crate4 depot0)
    (at crate5 depot0)

    (at hoist1 depot1)
    (at pallet1 depot1)
    (at pallet7 depot1)
    (at crate8 depot1)
    (at truck0 depot1)

    (at hoist2 depot2)
    (at pallet2 depot2)
    (at truck1 depot2)

    (at hoist3 distributor0)
    (at pallet3 distributor0)
    (at crate2 distributor0)
    (at crate9 distributor0)

    (at hoist4 distributor1)
    (at pallet4 distributor1)
    (at pallet8 distributor1)
    (at crate0 distributor1)
    (at crate6 distributor1)
    (at crate7 distributor1)

    (at hoist5 distributor2)
    (at pallet5 distributor2)
    (at pallet6 distributor2)
    (at crate3 distributor2)

    ;; on relations (explicit)
    (on crate5 crate1)
    (on crate9 crate2)
    (on crate7 crate6)
    (on crate4 pallet0)
    (on crate8 pallet1)
    (on crate2 pallet3)
    (on crate6 pallet4)
    (on crate3 pallet6)
    (on crate0 pallet8)
    (on crate1 pallet9)

    ;; clear surfaces (as provided)
    (clear crate0)
    (clear crate3)
    (clear crate4)
    (clear crate5)
    (clear crate7)
    (clear crate8)
    (clear crate9)
    (clear pallet2)
    (clear pallet5)
    (clear pallet7)

    ;; Note: surfaces that have crates on them are not clear (implicit by absence)

    ;; Distances (as provided, possibly asymmetric)
    (= (distance depot0 depot0) 0)
    (= (distance depot0 depot1) 2)
    (= (distance depot0 depot2) 10)
    (= (distance depot0 distributor0) 6)
    (= (distance depot0 distributor1) 1)
    (= (distance depot0 distributor2) 7)

    (= (distance depot1 depot0) 3)
    (= (distance depot1 depot1) 0)
    (= (distance depot1 depot2) 3)
    (= (distance depot1 distributor0) 1)
    (= (distance depot1 distributor1) 10)
    (= (distance depot1 distributor2) 3)

    (= (distance depot2 depot0) 7)
    (= (distance depot2 depot1) 3)
    (= (distance depot2 depot2) 0)
    (= (distance depot2 distributor0) 7)
    (= (distance depot2 distributor1) 2)
    (= (distance depot2 distributor2) 4)

    (= (distance distributor0 depot0) 4)
    (= (distance distributor0 depot1) 10)
    (= (distance distributor0 depot2) 6)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 8)
    (= (distance distributor0 distributor2) 3)

    (= (distance distributor1 depot0) 5)
    (= (distance distributor1 depot1) 3)
    (= (distance distributor1 depot2) 4)
    (= (distance distributor1 distributor0) 3)
    (= (distance distributor1 distributor1) 0)
    (= (distance distributor1 distributor2) 10)

    (= (distance distributor2 depot0) 7)
    (= (distance distributor2 depot1) 6)
    (= (distance distributor2 depot2) 1)
    (= (distance distributor2 distributor0) 6)
    (= (distance distributor2 distributor1) 2)
    (= (distance distributor2 distributor2) 0)
  )

  (:goal (and
    ;; goal on relations as specified
    (on crate7 crate6)
    (on crate9 crate7)
    (on crate4 pallet0)
    (on crate6 pallet1)
    (on crate2 pallet3)
    (on crate5 pallet5)
    (on crate1 pallet8)
  ))

  (:metric minimize (total-time))
)