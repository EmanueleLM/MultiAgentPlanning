(define (problem logistics-problem)
  (:domain logistics)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init
    (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
    (available hoist0) (available hoist1) (available hoist2) (available hoist3)
    (at crate0 depot1) (on crate0 pallet1)
    (at crate1 depot1) (on crate1 crate0) (clear crate1)
    (at crate2 depot0) (on crate2 pallet0) (clear crate2)
    (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
    (clear pallet2) (clear pallet3)
    (at truck0 depot1) (at truck1 depot1) (at truck2 distributor0)
  )
  (:goal
    (and
      (on crate1 pallet1)
      (at crate2 distributor0) (on crate2 pallet3)
    )
  )
)