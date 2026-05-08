(define (problem logistics-problem)
  (:domain logistics-domain)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    (at crate0 depot2) (on crate0 pallet2)
    (at crate1 depot0) (on crate1 pallet0)
    (at crate2 depot0) (on crate2 crate1)

    (at hoist0 depot0) (available hoist0)
    (at hoist1 depot1) (available hoist1)
    (at hoist2 depot2) (available hoist2)
    (at hoist3 distributor0) (available hoist3)

    (at truck0 distributor0)
    (at truck1 distributor0)
    (at truck2 depot2)

    (clear crate0) (clear crate2)
    (clear pallet1) (clear pallet3)
  )
  (:goal
    (and
      (on crate0 crate2)
      (on crate1 pallet2)
      (on crate2 pallet1)
    )
  )
)