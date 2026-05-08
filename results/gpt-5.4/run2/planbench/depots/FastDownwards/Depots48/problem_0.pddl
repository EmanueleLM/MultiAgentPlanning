(define (problem depots_instance_problem)
  (:domain depots_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    (pallet_at pallet0 depot0)
    (pallet_at pallet1 depot1)
    (pallet_at pallet2 depot2)
    (pallet_at pallet3 distributor0)

    (road depot0 depot1)
    (road depot0 depot2)
    (road depot0 distributor0)
    (road depot1 depot0)
    (road depot1 depot2)
    (road depot1 distributor0)
    (road depot2 depot0)
    (road depot2 depot1)
    (road depot2 distributor0)
    (road distributor0 depot0)
    (road distributor0 depot1)
    (road distributor0 depot2)

    (crate_at crate0 depot0)
    (crate_at crate1 depot2)
    (crate_at crate2 depot0)

    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (at truck0 depot2)
    (at truck1 depot2)
    (at truck2 depot0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 crate0)
  )

  (:goal
    (and
      (on crate0 crate1)
      (on crate1 pallet2)
      (on crate2 crate0)
    )
  )
)