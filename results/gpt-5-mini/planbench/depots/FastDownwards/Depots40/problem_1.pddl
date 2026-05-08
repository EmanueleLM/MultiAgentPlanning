(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate
  )

  (:init
    (truck_at truck0 depot0)
    (truck_at truck1 depot2)
    (truck_at truck2 depot1)

    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    (clear pallet0)
    (clear pallet2)

    (at crate0 distributor0)
    (on crate0 pallet3)
    (surface_at crate0 distributor0)

    (at crate1 distributor0)
    (on crate1 crate0)
    (surface_at crate1 distributor0)
    (clear crate1)

    (at crate2 depot1)
    (on crate2 pallet1)
    (surface_at crate2 depot1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 pallet2)
  ))
)