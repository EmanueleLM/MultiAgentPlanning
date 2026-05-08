(define (problem depot-instance)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
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
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot0)
    (at crate0 depot0)
    (on crate0 pallet0)
    (at crate1 depot0)
    (on crate1 crate0)
    (clear crate1)
    (at crate2 depot2)
    (on crate2 pallet2)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
  )
  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 pallet0)
      (on crate2 crate0)
    )
  )
)