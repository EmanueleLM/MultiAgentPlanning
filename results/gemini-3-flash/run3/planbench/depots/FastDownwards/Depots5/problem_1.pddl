(define (problem depots5)
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
    ;; Crate locations
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 distributor0)
    
    ;; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    
    ;; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    ;; Truck locations
    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot1)
    
    ;; Initial hoist states
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    
    ;; Initial surface clarity
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet2)
    ;; pallet3, crate0, crate1 are not clear
    
    ;; Initial stacking relations at distributor0
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)
  )
  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)