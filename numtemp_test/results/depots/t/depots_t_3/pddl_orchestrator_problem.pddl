(define (problem logistics-hoists-problem)
  (:domain logistics-hoists)

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
    crate0 crate1 crate2 crate3 crate4 crate5 - crate
  )

  (:init
    ;; Locations (at ...)
    ;; initial_locations mapping
    (at crate2 depot0)
    (at crate3 depot0)
    (at hoist0 depot0)
    (at pallet0 depot0)
    (at pallet7 depot0)
    (at pallet8 depot0)
    (at truck1 depot0)

    (at hoist1 depot1)
    (at pallet1 depot1)

    (at crate0 depot2)
    (at crate1 depot2)
    (at crate5 depot2)
    (at hoist2 depot2)
    (at pallet2 depot2)

    (at crate4 distributor0)
    (at hoist3 distributor0)
    (at pallet3 distributor0)
    (at pallet9 distributor0)

    (at hoist4 distributor1)
    (at pallet4 distributor1)
    (at pallet6 distributor1)
    (at truck0 distributor1)

    (at hoist5 distributor2)
    (at pallet5 distributor2)

    ;; on relations (stacks)
    (on crate1 crate0)
    (on crate5 crate1)
    (on crate2 pallet0)
    (on crate0 pallet2)
    (on crate4 pallet3)
    (on crate3 pallet8)

    ;; clear surfaces
    (clear crate2)
    (clear crate3)
    (clear crate4)
    (clear crate5)
    (clear pallet1)
    (clear pallet4)
    (clear pallet5)
    (clear pallet6)
    (clear pallet7)
    (clear pallet9)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (available hoist4)
    (available hoist5)

    ;; numeric values: truck speeds
    (= (speed truck0) 1)
    (= (speed truck1) 5)

    ;; hoist powers
    (= (power hoist0) 9)
    (= (power hoist1) 3)
    (= (power hoist2) 8)
    (= (power hoist3) 3)
    (= (power hoist4) 7)
    (= (power hoist5) 6)

    ;; crate weights
    (= (weight crate0) 55)
    (= (weight crate1) 100)
    (= (weight crate2) 81)
    (= (weight crate3) 26)
    (= (weight crate4) 50)
    (= (weight crate5) 71)

    ;; distances matrix (from -> to)
    (= (dist depot0 depot0) 0)
    (= (dist depot0 depot1) 3)
    (= (dist depot0 depot2) 3)
    (= (dist depot0 distributor0) 9)
    (= (dist depot0 distributor1) 6)
    (= (dist depot0 distributor2) 3)

    (= (dist depot1 depot0) 4)
    (= (dist depot1 depot1) 0)
    (= (dist depot1 depot2) 4)
    (= (dist depot1 distributor0) 6)
    (= (dist depot1 distributor1) 5)
    (= (dist depot1 distributor2) 2)

    (= (dist depot2 depot0) 9)
    (= (dist depot2 depot1) 4)
    (= (dist depot2 depot2) 0)
    (= (dist depot2 distributor0) 2)
    (= (dist depot2 distributor1) 10)
    (= (dist depot2 distributor2) 2)

    (= (dist distributor0 depot0) 3)
    (= (dist distributor0 depot1) 5)
    (= (dist distributor0 depot2) 2)
    (= (dist distributor0 distributor0) 0)
    (= (dist distributor0 distributor1) 5)
    (= (dist distributor0 distributor2) 1)

    (= (dist distributor1 depot0) 7)
    (= (dist distributor1 depot1) 7)
    (= (dist distributor1 depot2) 6)
    (= (dist distributor1 distributor0) 3)
    (= (dist distributor1 distributor1) 0)
    (= (dist distributor1 distributor2) 7)

    (= (dist distributor2 depot0) 3)
    (= (dist distributor2 depot1) 4)
    (= (dist distributor2 depot2) 9)
    (= (dist distributor2 distributor0) 5)
    (= (dist distributor2 distributor1) 3)
    (= (dist distributor2 distributor2) 0)
  )

  ;; Goals
  (:goal (and
    (on crate0 pallet0)
    (on crate5 pallet1)
    (on crate2 pallet4)
    (on crate1 pallet5)
    (on crate3 pallet7)
    (on crate4 pallet9)
  ))

  (:metric minimize (total-time))
)