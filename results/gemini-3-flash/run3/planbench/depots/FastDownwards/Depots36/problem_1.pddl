(define (problem depots36)
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
    ;; Places and connectivity are handled by any-to-any drive actions
    
    ;; Truck locations
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 depot0)
    
    ;; Hoist locations and availability
    (at hoist0 depot0) (available hoist0)
    (at hoist1 depot1) (available hoist1)
    (at hoist2 depot2) (available hoist2)
    (at hoist3 distributor0) (available hoist3)
    
    ;; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    ;; Crate locations and stacking
    (at crate0 depot0) (on crate0 pallet0) (clear crate0)
    (at crate1 depot2) (on crate1 pallet2) (clear crate1)
    (at crate2 distributor0) (on crate2 pallet3) (clear crate2)
    
    ;; Surface status (pallets 0, 2, and 3 are not clear because crates are on them)
    (clear pallet1)
  )
  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 pallet2)
      (on crate2 pallet1)
    )
  )
)