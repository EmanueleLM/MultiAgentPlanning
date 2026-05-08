(define (problem transport-crates-instance)
  (:domain hoist-operations-conservative)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; pallets and crates (pallet and crate are subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; surfaces' locations (pallets and crates)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    (at-surface crate0 depot0)
    (at-surface crate1 depot1)
    (at-surface crate2 distributor0)

    ;; crates initially on pallets
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)

    ;; crate tops clear (no crate stacked on them initially)
    (crate_clear crate0)
    (crate_clear crate1)
    (crate_clear crate2)

    ;; pallet2 is clear (no crate on it)
    (surface_clear pallet2)

    ;; hoists locations and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; trucks locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot1)
    (at-truck truck2 depot0)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)