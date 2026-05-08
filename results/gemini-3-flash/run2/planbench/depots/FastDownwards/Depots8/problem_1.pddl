(define (problem depots8)
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
    ;; Places of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    
    ;; Status of hoists
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    
    ;; Places of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    ;; Status of surfaces
    (clear pallet0)
    (clear pallet2)
    ;; pallet1 and pallet3 are occupied
    
    ;; Places of trucks
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 distributor0)
    
    ;; Places and positions of crates
    (at crate0 depot1)
    (on crate0 pallet1)
    
    (at crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)
    
    (at crate2 depot1)
    (on crate2 crate0)
    (clear crate2)
  )
  (:goal
    (and
      (on crate0 pallet0)
      (on crate2 pallet1)
    )
  )
)