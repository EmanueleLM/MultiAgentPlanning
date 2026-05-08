(define (problem depots13)
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
    ;; Places and initial locations of fixed objects
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (clear pallet3)
    
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)
    
    ;; Initial locations and states of trucks
    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 distributor0)
    
    ;; Initial locations and stacking of crates
    (at crate0 depot2)
    (on crate0 pallet2)
    (clear crate0)
    
    (at crate1 depot0)
    (on crate1 pallet0)
    (clear crate1)
    
    (at crate2 depot1)
    (on crate2 pallet1)
    (clear crate2)
  )
  (:goal (and
    (on crate0 pallet1)
    (on crate2 crate0)
  ))
)