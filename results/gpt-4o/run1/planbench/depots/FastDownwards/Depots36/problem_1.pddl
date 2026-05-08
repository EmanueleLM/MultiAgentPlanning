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
    ; Initial positions of crates
    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 distributor0)

    ; Initial positions of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ; Initial positions of trucks
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 depot0)

    ; Availability of hoists
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Clear state of crates
    (clear crate0)
    (clear crate1)
    (clear crate2)

    ; Clear state of pallets
    (clear pallet1)

    ; Crates on pallets
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)
  )

  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 pallet2)
      (on crate2 pallet1)
    )
  )
)