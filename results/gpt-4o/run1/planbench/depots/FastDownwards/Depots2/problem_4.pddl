(define (problem logistics-problem)
  (:domain logistics)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    (at crate0 depot2) (on crate0 pallet2)
    (at crate1 depot0) (on crate1 pallet0)
    (at crate2 depot2) (on crate2 crate0)
    
    (at hoist0 depot0) (hoist_available hoist0)
    (at hoist1 depot1) (hoist_available hoist1)
    (at hoist2 depot2) (hoist_available hoist2)
    (at hoist3 distributor0) (hoist_available hoist3)
    
    (at truck0 depot2)
    (at truck1 depot0)
    (at truck2 depot2)
    
    (clear pallet1)
    (clear pallet3)

    (clear crate1)
  )
  (:goal
    (and (on crate1 pallet0) (on crate2 pallet3))
  )
)