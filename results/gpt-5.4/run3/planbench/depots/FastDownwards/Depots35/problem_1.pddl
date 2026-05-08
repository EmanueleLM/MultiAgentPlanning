(define (problem depots35_problem)
  (:domain depots35)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    (at crate0 depot2)
    (at crate1 distributor0)
    (at crate2 depot2)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (at_truck truck0 depot0)
    (at_truck truck1 distributor0)
    (at_truck truck2 depot1)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)

    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 crate0)
  )

  (:goal
    (and
      (on crate0 pallet0)
      (on crate1 pallet1)
    )
  )
)