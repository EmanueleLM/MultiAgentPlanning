(define (problem depots44)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 depot1)
    (at truck1 distributor0)
    (at truck2 depot1)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (at crate0 depot1)
    (at crate1 depot1)
    (at crate2 depot0)
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
  )
  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 pallet1)
      (on crate2 pallet0)
    )
  )
)