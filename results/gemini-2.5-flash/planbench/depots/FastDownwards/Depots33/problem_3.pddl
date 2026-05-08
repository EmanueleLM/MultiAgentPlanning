(define (problem depots33-problem)
  (:domain depots33)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
    crate0 crate1 crate2 - crate
  )
  (:init
    ; Locations
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 depot2)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot0)

    ; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Crate and Pallet clear status
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)

    ; Stacking
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet2)
  )
  (:goal (and
    (on crate0 crate2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)