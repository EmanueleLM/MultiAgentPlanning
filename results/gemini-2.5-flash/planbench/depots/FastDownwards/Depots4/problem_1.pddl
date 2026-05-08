(define (problem depots4-problem)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    ;; Object locations
    (at depot0 depot0) (at depot1 depot1) (at depot2 depot2) (at distributor0 distributor0) ; Places are at themselves conceptually

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at truck0 depot2)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; Crate initial locations and stacking
    ; crate0 is at depot0, on pallet0
    (at crate0 depot0)
    (on crate0 pallet0)
    ; crate1 is at depot0, on crate0
    (at crate1 depot0)
    (on crate1 crate0)
    ; crate2 is at depot1, on pallet1
    (at crate2 depot1)
    (on crate2 pallet1)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Clear status - directly from description
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
    ; Implied not clear by presence of other objects on top:
    ; pallet0 is not clear (crate0 on it)
    ; crate0 is not clear (crate1 on it)
    ; pallet1 is not clear (crate2 on it)
  )
  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)
  ))
)