(define (problem depots4)
  (:domain logistics-hoist-truck)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    (surface_at crate0 depot0)
    (surface_at crate1 depot0)
    (surface_at crate2 depot1)

    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet1)

    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    (at_truck truck0 depot2)
    (at_truck truck1 depot1)
    (at_truck truck2 depot2)
  )

  (:goal (and
           (on crate0 pallet1)
           (on crate1 crate0)
           (on crate2 pallet0)
         )
  )
)