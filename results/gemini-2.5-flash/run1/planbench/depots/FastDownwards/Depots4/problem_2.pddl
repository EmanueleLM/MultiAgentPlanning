(define (problem depots4-problem)
  (:domain depots4)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
  )
  (:init
    ; Locations of objects
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot1)

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

    ; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; On relations and derived clarity
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet1)

    ; Explicitly clear surfaces (from problem statement, and consistent with 'on' relations)
    (clear crate1) ; nothing on crate1
    (clear crate2) ; nothing on crate2
    (clear pallet2) ; nothing on pallet2 initially
    (clear pallet3) ; nothing on pallet3 initially

    ; Inferred non-clear surfaces from 'on' relations
    ; The (not (clear X)) are not strictly necessary as they are the default,
    ; but they help make the initial state explicit and easy to audit.
    (not (clear pallet0)) ; crate0 is on pallet0
    (not (clear crate0))  ; crate1 is on crate0
    (not (clear pallet1)) ; crate2 is on pallet1
  )
  (:goal
    (and
      (on crate0 pallet1)
      (on crate1 crate0)
      (on crate2 pallet0)
    )
  )
)