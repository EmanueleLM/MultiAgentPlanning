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
    (at_truck truck0 depot0)
    (at_truck truck1 depot2)
    (at_truck truck2 depot2)
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)
    (at_crate crate0 depot0)
    (at_crate crate1 depot2)
    (at_crate crate2 depot1)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet1)
  )
  (:goal
    (and
      (on crate0 pallet0)
      (on crate1 pallet3)
      (on crate2 pallet2)
    )
  )
)