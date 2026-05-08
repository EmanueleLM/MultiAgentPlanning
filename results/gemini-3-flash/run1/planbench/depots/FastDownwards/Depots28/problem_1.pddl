(define (problem depots28_prob)
  (:domain depots28)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (clear pallet0)
    (clear pallet2)
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 depot0)
    (at crate0 distributor0)
    (on crate0 pallet3)
    (at crate1 distributor0)
    (on crate1 crate0)
    (clear crate1)
    (at crate2 depot1)
    (on crate2 pallet1)
    (clear crate2)
  )
  (:goal (and
    (on crate0 crate2)
    (on crate1 crate0)
    (on crate2 pallet0)
  ))
)