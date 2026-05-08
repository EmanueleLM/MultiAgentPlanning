(define (problem depots43_problem)
  (:domain depots43)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    (at_crate crate0 distributor0)
    (at_crate crate1 depot0)
    (at_crate crate2 depot2)

    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    (at_truck truck0 depot2)
    (at_truck truck1 depot2)
    (at_truck truck2 depot0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet1)

    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 pallet2)
  )

  (:goal
    (and
      (on crate0 pallet0)
      (on crate1 pallet2)
      (on crate2 crate1)
    )
  )
)