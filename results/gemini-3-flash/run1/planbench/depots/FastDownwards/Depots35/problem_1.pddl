(define (problem depots35)
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
    ;; Places and fixed surfaces
    (at pallet0 depot0)
    (clear pallet0)
    (at pallet1 depot1)
    (clear pallet1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    ;; Actors (Trucks and Hoists)
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot1)
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)

    ;; Crates and their stack relations
    (at crate0 depot2)
    (on crate0 pallet2)
    ;; crate0 is not clear because crate2 is on it
    
    (at crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)
    
    (at crate2 depot2)
    (on crate2 crate0)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet1)
  ))
)