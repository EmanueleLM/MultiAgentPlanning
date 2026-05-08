(define (problem depots24)
  (:domain logistics_stacking)
  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init
    ;; connectivity: trucks can drive between any two places (bidirectional adjacency)
    (adjacent depot0 depot1) (adjacent depot1 depot0)
    (adjacent depot0 depot2) (adjacent depot2 depot0)
    (adjacent depot0 distributor0) (adjacent distributor0 depot0)
    (adjacent depot1 depot2) (adjacent depot2 depot1)
    (adjacent depot1 distributor0) (adjacent distributor0 depot1)
    (adjacent depot2 distributor0) (adjacent distributor0 depot2)

    ;; Trucks initial locations
    (at-truck truck0 depot2)
    (at-truck truck1 depot0)
    (at-truck truck2 depot2)

    ;; Hoists initial locations and availability
    (at-hoist hoist0 depot0)
    (hoist-available hoist0)
    (at-hoist hoist1 depot1)
    (hoist-available hoist1)
    (at-hoist hoist2 depot2)
    (hoist-available hoist2)
    (at-hoist hoist3 distributor0)
    (hoist-available hoist3)

    ;; Pallets and crates initial locations (surfaces)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at crate0 depot0)
    (at crate1 distributor0)
    (at crate2 depot2)

    ;; stacking: crate on supporting surface
    (on crate0 pallet0)
    (on crate1 pallet3)
    (on crate2 pallet2)

    ;; clear/top-free facts: crates and pallet1
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
  )
  (:goal (and
    (on crate0 crate2)
    (on crate1 pallet2)
    (on crate2 pallet0)
  ))
)