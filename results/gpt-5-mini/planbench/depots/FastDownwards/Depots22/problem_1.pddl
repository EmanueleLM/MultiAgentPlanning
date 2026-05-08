(define (problem depots22)
  (:domain depots)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates initial placement (both on-surface and at-place are represented)
    (on crate0 pallet1)
    (at crate0 depot1)
    (clear crate0)

    (on crate1 pallet2)
    (at crate1 depot2)
    (clear crate1)

    (on crate2 pallet3)
    (at crate2 distributor0)
    (clear crate2)

    ;; pallet0 is clear (nothing on it initially)
    (clear pallet0)

    ;; hoists locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; trucks locations
    (at-truck truck0 distributor0)
    (at-truck truck1 depot1)
    (at-truck truck2 depot1)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet0)
  ))
)