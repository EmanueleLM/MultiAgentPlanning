(define (problem depots2-problem)
  (:domain depots2)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init
    (at-truck truck0 depot2)
    (at-truck truck1 depot0)
    (at-truck truck2 depot2)

    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 crate0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ; Inferred 'not clear' states based on initial stacking
    (not (clear pallet0)) ; crate1 is on pallet0
    (not (clear pallet2)) ; crate0 is on pallet2
    (not (clear crate0))  ; crate2 is on crate0

    ; Derived 'at-crate' states based on initial stacking and pallet locations
    (at-crate crate0 depot2)
    (at-crate crate1 depot0)
    (at-crate crate2 depot2)
  )
  (:goal (and
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)