(define (problem logistics_problem)
  (:domain logistics)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  
  (:init
    ; Crate locations
    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 distributor0)

    ; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ; Truck locations
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 depot0)

    ; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Crate clear status
    (clear crate0)
    (clear crate1)
    (clear crate2)

    ; Pallet clear status
    (clear pallet1)

    ; Crates on pallets
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)

    ; Connections
    (connected depot0 depot1) (connected depot1 depot0)
    (connected depot0 depot2) (connected depot2 depot0)
    (connected depot0 distributor0) (connected distributor0 depot0)
    (connected depot1 distributor0) (connected distributor0 depot1)
    (connected depot1 depot2) (connected depot2 depot1)
    (connected distributor0 depot2) (connected depot2 distributor0)
  )

  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 pallet2)
      (on crate2 pallet1)
    )
  )
)