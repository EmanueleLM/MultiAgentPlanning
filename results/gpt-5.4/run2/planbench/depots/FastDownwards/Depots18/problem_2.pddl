(define (problem depots18_problem)
  (:domain depots18)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )

  (:init
    (at crate0 depot1)
    (at crate1 depot0)
    (at crate2 distributor0)

    (surface_at crate0 depot1)
    (surface_at crate1 depot0)
    (surface_at crate2 distributor0)
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (truck_at truck0 depot0)
    (truck_at truck1 depot0)
    (truck_at truck2 distributor0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)

    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)

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
  )

  (:goal
    (and
      (on crate0 crate2)
      (on crate1 pallet2)
      (on crate2 pallet3)
    )
  )
)