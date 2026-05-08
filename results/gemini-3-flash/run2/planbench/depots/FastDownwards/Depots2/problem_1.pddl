(define (problem depots2_problem)
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
    ;; Places and fixed locatables
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    
    (at truck0 depot2)
    (at truck1 depot0)
    (at truck2 depot2)
    
    (at crate0 depot2)
    (at crate1 depot0)
    (at crate2 depot2)
    
    ;; Hoist status
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    
    ;; Clear status
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
    ;; Note: pallet0, pallet2, and crate0 are not clear initially.
    
    ;; Stacking relations
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 crate0)
  )
  (:goal
    (and
      (on crate1 pallet0)
      (on crate2 pallet3)
    )
  )
)