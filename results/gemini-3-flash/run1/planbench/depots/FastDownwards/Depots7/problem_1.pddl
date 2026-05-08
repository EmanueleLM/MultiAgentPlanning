(define (problem depots7)
  (:domain depots7)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; Places and Pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    ;; Crates initial state
    (at crate0 depot1)
    (on crate0 pallet1)
    (at crate1 distributor0)
    (on crate1 pallet3)
    (at crate2 depot0)
    (on crate2 pallet0)
    
    ;; Hoists initial state
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)
    
    ;; Trucks initial state
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot1)
    
    ;; Clear status
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    ;; (pallet0, pallet1, pallet3 are not clear because crates are on them)
  )
  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 crate2)
      (on crate2 pallet1)
    )
  )
)