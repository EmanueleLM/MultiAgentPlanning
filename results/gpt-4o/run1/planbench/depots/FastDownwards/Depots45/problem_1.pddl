(define (problem logistics-problem)
  (:domain logistics)
  (:objects 
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init 
    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 distributor0)
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot1)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear_surface pallet0)
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 pallet3)
    ;; Ensure all places are connected to each other
    (connected depot0 depot1)
    (connected depot1 depot2)
    (connected depot2 distributor0)
    ;; Symmetric connections
    (connected depot1 depot0)
    (connected depot2 depot1)
    (connected distributor0 depot2)
    (connected distributor0 depot0)
    (connected depot0 distributor0)
  )
  (:goal 
    (and (on crate0 pallet0) 
         (on crate1 pallet1) 
         (on crate2 crate0))
  )
)