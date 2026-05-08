(define (problem logistics-problem)
  (:domain logistics)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )
  (:init
    (at crate0 depot0) (on crate0 pallet0)
    (at crate1 depot0) (on crate1 crate0)
    (at crate2 depot2) (on crate2 pallet2)
    (at hoist0 depot0) (available hoist0)
    (at hoist1 depot1) (available hoist1)
    (at hoist2 depot2) (available hoist2)
    (at hoist3 distributor0) (available hoist3)
    (at pallet0 depot0)
    (at pallet1 depot1) (clear pallet1)
    (at pallet2 depot2)
    (at pallet3 distributor0) (clear pallet3)
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot0)
  )
  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 crate0)
  ))
)