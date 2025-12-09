(define (problem depots7-instance)
  (:domain depots-logistics)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; Locations of pallets (stationary)
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; Initial crate placements (stack + place)
    (on-pallet crate0 pallet1)
    (at-crate crate0 depot1)

    (on-pallet crate1 pallet3)
    (at-crate crate1 distributor0)

    (on-pallet crate2 pallet0)
    (at-crate crate2 depot0)

    ;; Clearance status
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)
    (clear-pallet pallet2)  ;; only pallet2 is explicitly clear initially

    ;; Hoists positions and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Trucks positions
    (at-truck truck0 depot0)
    (at-truck truck1 distributor0)
    (at-truck truck2 depot1)
  )

  (:goal (and
    (on-pallet crate0 pallet3)
    (on-crate  crate1 crate2)
    (on-pallet crate2 pallet1)
  ))
)