(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    depot0 distributor0 distributor1 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 - hoist
    crate0 crate1 - crate
    pallet0 pallet1 pallet2 - pallet
  )

  (:init
    ; locations: hoists, pallets, trucks
    (at hoist0 depot0)
    (at hoist1 distributor0)
    (at hoist2 distributor1)

    (at pallet0 depot0)
    (at pallet1 distributor0)
    (at pallet2 distributor1)

    (at truck0 distributor1)
    (at truck1 depot0)

    ; crate on relations (initial stacks)
    (on crate1 pallet0)
    (on crate0 pallet1)

    ; clear surfaces
    (clear crate0)
    (clear crate1)
    (clear pallet2)

    ; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)

    ; no crate initially in truck (empty)

    ; numeric fluent assignments (speeds, powers, weights, distances)
    (= (speed truck0) 4)
    (= (speed truck1) 8)

    (= (power hoist0) 2)
    (= (power hoist1) 9)
    (= (power hoist2) 6)

    (= (weight crate0) 11)
    (= (weight crate1) 86)

    ; distance table (asymmetric allowed by entries)
    (= (dist depot0 depot0) 0)
    (= (dist depot0 distributor0) 5)
    (= (dist depot0 distributor1) 7)

    (= (dist distributor0 depot0) 5)
    (= (dist distributor0 distributor0) 0)
    (= (dist distributor0 distributor1) 5)

    (= (dist distributor1 depot0) 4)
    (= (dist distributor1 distributor0) 4)
    (= (dist distributor1 distributor1) 0)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate0 pallet2)
  ))

  (:metric minimize (total-time))
)