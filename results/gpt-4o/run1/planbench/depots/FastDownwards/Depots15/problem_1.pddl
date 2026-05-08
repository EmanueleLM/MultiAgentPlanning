(define (problem logistics-instance)
  (:domain logistics)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )

  (:init
    (at_truck truck0 depot2)
    (at_truck truck1 depot2)
    (at_truck truck2 depot1)
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)
    (at_crate crate0 depot2)
    (at_crate crate1 depot1)
    (at_crate crate2 depot2)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)
    (on_crate crate0 pallet2)
    (on_crate crate1 pallet1)
    (on_crate crate2 crate0)
    (clear pallet0)
    (clear pallet3)
    (clear crate1)
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)
  )

  (:goal (and
    (on_crate crate0 pallet3)
    (on_crate crate1 crate2)
    (on_crate crate2 pallet2)
  ))
)