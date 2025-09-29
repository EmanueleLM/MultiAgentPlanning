(define (problem multi-agent-warehouse-problem)
  (:domain multi-agent-warehouse)

  (:objects
    depot0 distributor0 distributor1 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 - hoist
    pallet0 pallet1 pallet2 - pallet
    crate0 crate1 crate2 crate3 - crate
  )

  (:init
    (at crate0 depot0)
    (at hoist0 depot0)
    (at pallet0 depot0)
    (at truck0 depot0)
    (at truck1 depot0)

    (at crate3 distributor0)
    (at hoist1 distributor0)
    (at pallet1 distributor0)

    (at crate1 distributor1)
    (at crate2 distributor1)
    (at hoist2 distributor1)
    (at pallet2 distributor1)

    (on crate2 crate1)
    (on crate0 pallet0)
    (on crate3 pallet1)
    (on crate1 pallet2)

    (clear crate0)
    (clear crate2)
    (clear crate3)

    (empty hoist0)
    (empty hoist1)
    (empty hoist2)

    (= (total-time) 0)

    (= (distance depot0 depot0) 0)
    (= (distance depot0 distributor0) 1)
    (= (distance depot0 distributor1) 10)
    (= (distance distributor0 depot0) 2)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 9)
    (= (distance distributor1 depot0) 10)
    (= (distance distributor1 distributor0) 2)
    (= (distance distributor1 distributor1) 0)

    (= (speed truck0) 3)
    (= (speed truck1) 1)

    (= (power hoist0) 9)
    (= (power hoist1) 4)
    (= (power hoist2) 3)

    (= (weight crate0) 32)
    (= (weight crate1) 4)
    (= (weight crate2) 89)
    (= (weight crate3) 62)

    (stationary truck0)
    (stationary truck1)
  )

  (:goal (and
    (on crate1 crate3)
    (on crate2 pallet0)
    (on crate3 pallet1)
    (on crate0 pallet2)
  ))

  (:metric minimize (total-time))
)