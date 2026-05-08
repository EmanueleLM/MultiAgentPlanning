(define (problem depots6_problem)
  (:domain depots6)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    ;; Locations
    (at crate0 depot2)
    (at crate1 depot0)
    (at crate2 depot0)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 distributor0)
    (at truck1 distributor0)
    (at truck2 depot2)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Stacking relations
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 crate1)

    ;; Clear status - based on explicit statement and stacking relations
    (clear crate0) ; Nothing on crate0
    (clear crate2) ; Nothing on crate2
    (clear pallet1) ; Nothing on pallet1
    (clear pallet3) ; Nothing on pallet3
    ;; crate1 is not clear because crate2 is on it (omitted, implying false)
    ;; pallet0 is not clear because crate1 is on it (omitted, implying false)
    ;; pallet2 is not clear because crate0 is on it (omitted, implying false)

    ;; All 'lifting' and 'in' predicates are initially false by closed-world assumption
  )
  (:goal
    (and
      (on crate0 crate2)
      (on crate1 pallet2)
      (on crate2 pallet1)
    )
  )
)