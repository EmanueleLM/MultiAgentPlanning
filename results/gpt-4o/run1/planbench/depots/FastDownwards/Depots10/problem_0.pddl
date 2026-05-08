(define (problem logistics-problem)
  (:domain logistics)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )
  (:init
    (at depot1 crate0)
    (at depot1 crate1)
    (at depot0 crate2)
    (at depot0 hoist0)
    (at depot1 hoist1)
    (at depot2 hoist2)
    (at distributor0 hoist3)
    (at depot0 pallet0)
    (at depot1 pallet1)
    (at depot2 pallet2)
    (at distributor0 pallet3)
    (at depot2 truck0)
    (at distributor0 truck1)
    (at depot1 truck2)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
    (on pallet1 crate0)
    (on crate0 crate1)
    (on pallet0 crate2)
  )
  (:goal
    (and
      (on pallet2 crate0)
      (on pallet0 crate1)
      (on pallet1 crate2)
    )
  )
)