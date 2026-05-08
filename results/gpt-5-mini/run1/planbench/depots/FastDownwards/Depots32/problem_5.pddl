(define (problem depots32)
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
    ;; truck locations
    (truck_at truck0 depot2)
    (truck_at truck1 distributor0)
    (truck_at truck2 depot1)

    ;; hoist locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; surfaces (pallets and crates) at places
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    (surface_at crate0 depot1)
    (surface_at crate1 depot0)
    (surface_at crate2 distributor0)

    ;; stacking relations
    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)

    ;; clear facts (tops that have nothing on them)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
  )

  (:goal (and
    (on crate1 crate2)
    (on crate2 pallet3)
  ))
)