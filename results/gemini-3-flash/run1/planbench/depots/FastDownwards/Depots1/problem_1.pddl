(define (problem depots1)
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
    ;; Locations of fixed objects
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    
    ;; Initial hoist status
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    
    ;; Initial truck status
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot0)
    
    ;; Initial crate status and stacking
    (at crate0 depot0)
    (on crate0 pallet0)
    (at crate1 depot0)
    (on crate1 crate0)
    (at crate2 depot2)
    (on crate2 pallet2)
    
    ;; Initial clear status
    ;; crate1 is on top of crate0, which is on pallet0
    (clear crate1)
    ;; pallet1 is empty
    (clear pallet1)
    ;; crate2 is on top of pallet2
    (clear crate2)
    ;; pallet3 is empty
    (clear pallet3)
    
    ;; Implicitly: not clear(crate0), not clear(pallet0), not clear(pallet2)
  )
  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 pallet0)
      (on crate2 crate0)
    )
  )
)