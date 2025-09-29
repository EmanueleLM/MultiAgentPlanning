(define (problem orchestrator-problem)
  (:domain orchestrator)

  (:objects
    depot0 distributor0 distributor1 - place

    truck0 truck1 - truck

    hoist0 hoist1 hoist2 - hoist

    pallet0 pallet1 pallet2 - pallet

    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 - crate
  )

  (:init
    ;; typing facts (optional but explicit)
    (truck truck0)
    (truck truck1)
    (hoist hoist0)
    (hoist hoist1)
    (hoist hoist2)
    (pallet pallet0)
    (pallet pallet1)
    (pallet pallet2)
    (crate crate0)
    (crate crate1)
    (crate crate2)
    (crate crate3)
    (crate crate4)
    (crate crate5)
    (crate crate6)
    (crate crate7)

    ;; initial locations for hoists and pallets (from initial_locations / stacks)
    (at hoist0 depot0)
    (at pallet0 depot0)
    (at hoist1 distributor0)
    (at pallet1 distributor0)
    (at hoist2 distributor1)
    (at pallet2 distributor1)

    ;; trucks initial locations (both at distributor1)
    (at truck0 distributor1)
    (at truck1 distributor1)

    ;; crate stacking relations (on) as given; also assert crate/place locations (top-level place)
    ;; depot0 stack: pallet0, crate0, crate1, crate4, crate7
    (on crate0 pallet0)
    (at crate0 depot0)
    (on crate1 crate0)
    (at crate1 depot0)
    (on crate4 crate1)
    (at crate4 depot0)
    (on crate7 crate4)
    (at crate7 depot0)

    ;; distributor0 stack: pallet1, crate2
    (on crate2 pallet1)
    (at crate2 distributor0)

    ;; distributor1 stack: pallet2, crate3, crate5, crate6
    (on crate3 pallet2)
    (at crate3 distributor1)
    (on crate5 crate3)
    (at crate5 distributor1)
    (on crate6 crate5)
    (at crate6 distributor1)

    ;; clear surfaces initially (top-of-stack)
    (clear crate2)
    (clear crate6)
    (clear crate7)

    ;; available hoists
    (available hoist0)
    (available hoist1)
    (available hoist2)

    ;; numeric function initializations: distances
    (= (dist depot0 depot0) 0)
    (= (dist depot0 distributor0) 5)
    (= (dist depot0 distributor1) 4)

    (= (dist distributor0 depot0) 6)
    (= (dist distributor0 distributor0) 0)
    (= (dist distributor0 distributor1) 10)

    (= (dist distributor1 depot0) 5)
    (= (dist distributor1 distributor0) 2)
    (= (dist distributor1 distributor1) 0)

    ;; truck speeds
    (= (speed truck0) 4)
    (= (speed truck1) 5)

    ;; hoist powers
    (= (power hoist0) 3)
    (= (power hoist1) 7)
    (= (power hoist2) 9)

    ;; crate weights
    (= (weight crate0) 6)
    (= (weight crate1) 22)
    (= (weight crate2) 23)
    (= (weight crate3) 87)
    (= (weight crate4) 89)
    (= (weight crate5) 50)
    (= (weight crate6) 18)
    (= (weight crate7) 93)

    ;; total-time starts at zero
    (= (total-time) 0)
  )

  (:goal (and
    ;; desired stacking goals
    (on crate0 crate4)
    (on crate2 crate6)
    (on crate4 crate7)
    (on crate7 pallet0)
    (on crate6 pallet1)
    (on crate5 pallet2)
  ))

  (:metric minimize (total-time))
)