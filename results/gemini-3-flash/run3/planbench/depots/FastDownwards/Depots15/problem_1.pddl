(define (problem depots15)
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
    ;; Hoist locations and availability
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)

    ;; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Truck locations
    (at truck0 depot2)
    (at truck1 depot2)
    (at truck2 depot1)

    ;; Crate locations and stacking
    (at crate0 depot2)
    (on crate0 pallet2)
    
    (at crate1 depot1)
    (on crate1 pallet1)
    
    (at crate2 depot2)
    (on crate2 crate0)

    ;; Clear status
    (clear pallet0)
    (clear pallet3)
    (clear crate1)
    (clear crate2)
    ;; (pallet1 is not clear because crate1 is on it)
    ;; (pallet2 is not clear because crate0 is on it)
    ;; (crate0 is not clear because crate2 is on it)
  )

  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 crate2)
      (on crate2 pallet2)
    )
  )
)