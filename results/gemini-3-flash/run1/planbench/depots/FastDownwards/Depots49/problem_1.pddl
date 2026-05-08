(define (problem depots49_problem)
  (:domain depots49)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; Locations of places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    
    (at truck0 depot2)
    (at truck1 depot2)
    (at truck2 depot1)
    
    (at crate0 depot0)
    (at crate1 depot1)
    (at crate2 depot1)

    ;; Hoist status
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Stacking relations
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 crate1)

    ;; Surface clear status
    (clear crate0)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
    ;; (pallet0, pallet1, crate1 are not clear)
  )
  (:goal (and
    (on crate0 pallet2)
    (on crate2 pallet0)
  ))
)