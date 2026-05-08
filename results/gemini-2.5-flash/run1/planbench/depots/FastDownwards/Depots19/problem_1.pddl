(define (problem depots-19-problem)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
  )
  (:init
    ;; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crate locations
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot2)

    ;; Truck locations
    (at truck0 depot0)
    (at truck1 depot2)
    (at truck2 distributor0)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Initial stacking
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; Initial clearance status for explicitly mentioned items
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; Inferred non-clear states from 'on' relations
    ;; If crate0 is on pallet0, then pallet0 is not clear
    (not (clear pallet0))
    ;; If crate1 is on crate0, then crate0 is not clear
    (not (clear crate0))
    ;; If crate2 is on pallet2, then pallet2 is not clear
    (not (clear pallet2))

    ;; No items are initially lifting or in a truck, so these predicates are false by default
  )
  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet1)
  ))
)