(define (problem depots12)
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
    ;; Locations of places and locatables
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    (at truck0 depot1)
    (at truck1 depot0)
    (at truck2 depot1)
    
    (at crate0 depot2)
    (at crate1 distributor0)
    (at crate2 distributor0)

    ;; Statuses of hoists
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Statuses of surfaces
    (clear pallet0)
    (clear pallet1)
    (clear crate0)
    (clear crate2)
    ;; crate1 is not clear because crate2 is on it
    ;; pallet2 is not clear because crate0 is on it
    ;; pallet3 is not clear because crate1 is on it

    ;; On relations
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 crate1)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)