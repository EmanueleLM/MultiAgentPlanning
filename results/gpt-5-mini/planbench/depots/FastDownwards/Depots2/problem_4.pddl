(define (problem depots2-instance)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (at_truck truck0 depot2)
    (at_truck truck1 depot0)
    (at_truck truck2 depot2)
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)
    (on crate0 pallet2)
    (surface_at crate0 depot2)
    (on crate2 crate0)
    (surface_at crate2 depot2)
    (on crate1 pallet0)
    (surface_at crate1 depot0)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal (and
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)