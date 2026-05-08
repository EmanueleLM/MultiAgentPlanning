(define (problem depots40)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; Places and connectivity are handled by the drive action over all places.
    
    ;; Locations of Pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    ;; Locations of Hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    
    ;; Locations of Trucks
    (at truck0 depot0)
    (at truck1 depot2)
    (at truck2 depot1)
    
    ;; Locations of Crates
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 depot1)
    
    ;; Status of Hoists
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    
    ;; Stacking relations
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)
    
    ;; Surface clarity
    (clear pallet0)
    (clear pallet2)
    (clear crate1)
    (clear crate2)
    ;; pallet1 is occupied by crate2
    ;; pallet3 is occupied by crate0
    ;; crate0 is occupied by crate1
  )

  (:goal
    (and
      (on crate0 pallet1)
      (on crate1 pallet3)
      (on crate2 pallet2)
    )
  )
)