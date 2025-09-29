(define (problem multiagent-warehouse-problem)
  (:domain multiagent-warehouse)

  (:objects
    depot0 depot1 depot2 depot3 - depots
    distributor0 distributor1 distributor2 distributor3 - distributors

    truck0 truck1 truck2 truck3 - truck
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 - hoist

    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate
  )

  (:init
    ;; hoists and pallets and trucks at places
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 depot3)
    (at-hoist hoist4 distributor0)
    (at-hoist hoist5 distributor1)
    (at-hoist hoist6 distributor2)
    (at-hoist hoist7 distributor3)

    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 depot3)
    (at-pallet pallet4 distributor0)
    (at-pallet pallet5 distributor1)
    (at-pallet pallet6 distributor2)
    (at-pallet pallet7 distributor3)
    ;; pallet8 and pallet9 not explicitly placed in initial mapping? They appear in depot1 and depot2 lists in initial 'at' mapping: include them
    (at-pallet pallet8 depot1)
    (at-pallet pallet9 depot2)

    (at truck1 depot0)
    (at truck2 depot1)
    (at truck0 distributor2)
    (at truck3 distributor1)

    ;; initial on relations (crate -> supporting surface)
    ;; mapping from initial 'on'
    (on crate10 crate0)
    (on crate9 crate1)
    (on crate5 crate2)
    (on crate4 crate3)
    (on crate13 crate4)
    (on crate12 crate6)
    (on crate8 crate7)
    (on crate14 crate12)
    (on crate3 pallet0)
    (on crate6 pallet1)
    (on crate2 pallet3)
    (on crate1 pallet5)
    (on crate7 pallet6)
    (on crate0 pallet7)
    (on crate11 pallet8)

    ;; crate locations (top-level place for each crate)
    ;; provided crate_locations entries
    (at-crate crate3 depot0)
    (at-crate crate4 depot0)
    (at-crate crate13 depot0)
    (at-crate crate6 depot1)
    (at-crate crate11 depot1)
    (at-crate crate12 depot1)
    (at-crate crate14 depot1)
    (at-crate crate2 depot3)
    (at-crate crate5 depot3)
    (at-crate crate1 distributor1)
    (at-crate crate9 distributor1)
    (at-crate crate7 distributor2)
    (at-crate crate8 distributor2)
    (at-crate crate0 distributor3)
    (at-crate crate10 distributor3)

    ;; crates not explicitly in crate_locations but present in on relations:
    ;; set their place consistent with the supporting pallet/place if not already listed
    (at-crate crate10 distributor3)
    (at-crate crate9 distributor1)
    (at-crate crate5 depot3)
    (at-crate crate4 depot0)
    (at-crate crate13 depot0)
    (at-crate crate12 depot1)
    (at-crate crate8 distributor2)
    (at-crate crate14 depot1)
    (at-crate crate0 distributor3)
    (at-crate crate6 depot1)
    (at-crate crate2 depot3)
    (at-crate crate1 distributor1)
    (at-crate crate7 distributor2)
    (at-crate crate11 depot1)
    (at-crate crate3 depot0)

    ;; hoists available initially
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)
    (hoist-available hoist6)
    (hoist-available hoist7)

    ;; clear surfaces initially (from input 'clear' list)
    (clear crate5)
    (clear crate8)
    (clear crate9)
    (clear crate10)
    (clear crate11)
    (clear crate13)
    (clear crate14)
    (clear pallet2)
    (clear pallet4)
    (clear pallet9)

    ;; numeric attributes: truck speeds
    (= (speed truck0) 7)
    (= (speed truck1) 1)
    (= (speed truck2) 6)
    (= (speed truck3) 8)

    ;; hoist powers
    (= (power hoist0) 1)
    (= (power hoist1) 1)
    (= (power hoist2) 6)
    (= (power hoist3) 9)
    (= (power hoist4) 3)
    (= (power hoist5) 9)
    (= (power hoist6) 8)
    (= (power hoist7) 7)

    ;; crate weights
    (= (weight crate0) 64)
    (= (weight crate1) 1)
    (= (weight crate2) 50)
    (= (weight crate3) 56)
    (= (weight crate4) 36)
    (= (weight crate5) 68)
    (= (weight crate6) 90)
    (= (weight crate7) 55)
    (= (weight crate8) 94)
    (= (weight crate9) 44)
    (= (weight crate10) 36)
    (= (weight crate11) 47)
    (= (weight crate12) 88)
    (= (weight crate13) 97)
    (= (weight crate14) 84)

    ;; distances between places (as provided)
    ;; depot0 row
    (= (distance depot0 depot0) 0)
    (= (distance depot0 depot1) 6)
    (= (distance depot0 depot2) 7)
    (= (distance depot0 depot3) 1)
    (= (distance depot0 distributor0) 7)
    (= (distance depot0 distributor1) 1)
    (= (distance depot0 distributor2) 7)
    (= (distance depot0 distributor3) 6)

    ;; depot1 row
    (= (distance depot1 depot0) 9)
    (= (distance depot1 depot1) 0)
    (= (distance depot1 depot2) 1)
    (= (distance depot1 depot3) 4)
    (= (distance depot1 distributor0) 10)
    (= (distance depot1 distributor1) 8)
    (= (distance depot1 distributor2) 2)
    (= (distance depot1 distributor3) 2)

    ;; depot2 row
    (= (distance depot2 depot0) 6)
    (= (distance depot2 depot1) 1)
    (= (distance depot2 depot2) 0)
    (= (distance depot2 depot3) 2)
    (= (distance depot2 distributor0) 3)
    (= (distance depot2 distributor1) 10)
    (= (distance depot2 distributor2) 9)
    (= (distance depot2 distributor3) 4)

    ;; depot3 row
    (= (distance depot3 depot0) 5)
    (= (distance depot3 depot1) 6)
    (= (distance depot3 depot2) 7)
    (= (distance depot3 depot3) 0)
    (= (distance depot3 distributor0) 5)
    (= (distance depot3 distributor1) 7)
    (= (distance depot3 distributor2) 6)
    (= (distance depot3 distributor3) 5)

    ;; distributor0 row
    (= (distance distributor0 depot0) 3)
    (= (distance distributor0 depot1) 3)
    (= (distance distributor0 depot2) 6)
    (= (distance distributor0 depot3) 9)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 2)
    (= (distance distributor0 distributor2) 5)
    (= (distance distributor0 distributor3) 1)

    ;; distributor1 row
    (= (distance distributor1 depot0) 10)
    (= (distance distributor1 depot1) 5)
    (= (distance distributor1 depot2) 5)
    (= (distance distributor1 depot3) 10)
    (= (distance distributor1 distributor0) 3)
    (= (distance distributor1 distributor1) 0)
    (= (distance distributor1 distributor2) 2)
    (= (distance distributor1 distributor3) 9)

    ;; distributor2 row
    (= (distance distributor2 depot0) 8)
    (= (distance distributor2 depot1) 5)
    (= (distance distributor2 depot2) 10)
    (= (distance distributor2 depot3) 10)
    (= (distance distributor2 distributor0) 5)
    (= (distance distributor2 distributor1) 9)
    (= (distance distributor2 distributor2) 0)
    (= (distance distributor2 distributor3) 9)

    ;; distributor3 row
    (= (distance distributor3 depot0) 4)
    (= (distance distributor3 depot1) 9)
    (= (distance distributor3 depot2) 10)
    (= (distance distributor3 depot3) 9)
    (= (distance distributor3 distributor0) 6)
    (= (distance distributor3 distributor1) 6)
    (= (distance distributor3 distributor2) 3)
    (= (distance distributor3 distributor3) 0)

    ;; initialize total-time
    (= (total-time) 0)
  )

  (:goal (and
    ;; stacking goals as given:
    (on crate3 crate0)
    (on crate13 crate2)
    (on crate4 crate5)
    (on crate12 crate6)
    (on crate9 crate8)
    (on crate1 crate11)
    (on crate5 crate14)
    (on crate14 pallet1)
    (on crate7 pallet2)
    (on crate0 pallet3)
    (on crate6 pallet4)
    (on crate11 pallet5)
    (on crate2 pallet6)
    (on crate8 pallet7)
  ))

  (:metric minimize (total-time))
)