(define (problem depots2_prob)
  (:domain depots2)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Places and fixed objects
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    ;; Initial clearances
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
    
    ;; Hoists status
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)
    
    ;; Trucks status
    (at truck0 depot2)
    (at truck1 depot0)
    (at truck2 depot2)
    
    ;; Crates status
    (at crate0 depot2)
    (on crate0 pallet2)
    (at crate1 depot0)
    (on crate1 pallet0)
    (at crate2 depot2)
    (on crate2 crate0)
  )

  (:goal (and
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)