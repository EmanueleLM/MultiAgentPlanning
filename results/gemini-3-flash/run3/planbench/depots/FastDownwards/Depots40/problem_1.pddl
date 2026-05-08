(define (problem depots_40)
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
    ;; Locations of stationary surfaces
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    ;; Locations of trucks
    (at truck0 depot0)
    (at truck1 depot2)
    (at truck2 depot1)
    
    ;; Locations of hoists and their availability
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)
    
    ;; Locations of crates and their stacking relations
    (at crate0 distributor0)
    (on crate0 pallet3)
    (at crate1 distributor0)
    (on crate1 crate0)
    (at crate2 depot1)
    (on crate2 pallet1)
    
    ;; Clear properties
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
    ;; (Note: pallet1, pallet3, and crate0 are not clear because something is on them)
  )

  (:goal
    (and
      (on crate0 pallet1)
      (on crate1 pallet3)
      (on crate2 pallet2)
    )
  )
)