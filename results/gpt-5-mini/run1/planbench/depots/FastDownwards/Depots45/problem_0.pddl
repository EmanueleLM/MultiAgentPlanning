(define (problem jack_instance)
  (:domain jack_of_all_trades_instance)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; Truck locations
    (truck_at truck0 distributor0)
    (truck_at truck1 depot0)
    (truck_at truck2 depot1)

    ;; Hoist locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; Pallet locations (pallet0 is clear; pallets with crates on them are NOT marked clear here)
    (at pallet0 depot0)
    (clear pallet0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crates: locations, on-relations, and crate-level clarity
    (at crate0 depot1)
    (on crate0 pallet1)
    (clear crate0)

    (at crate1 depot2)
    (on crate1 pallet2)
    (clear crate1)

    (at crate2 distributor0)
    (on crate2 pallet3)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 crate0)
  ))
)