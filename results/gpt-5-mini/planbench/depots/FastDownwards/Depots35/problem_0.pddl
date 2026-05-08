(define (problem jack_problem_instance)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate
  )

  (:init
    ;; hoist locations
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; truck locations
    (truck_at truck0 depot0)
    (truck_at truck1 distributor0)
    (truck_at truck2 depot1)

    ;; pallet (surface) locations
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; clear surfaces
    (clear pallet0)
    (clear pallet1)

    ;; crate locations and stacking
    (crate_at crate0 depot2)
    (on crate0 pallet2)

    (crate_at crate1 distributor0)
    (on crate1 pallet3)

    (crate_at crate2 depot2)
    (on crate2 crate0)

    ;; crate clear flags
    (clear crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet1)
  ))
)