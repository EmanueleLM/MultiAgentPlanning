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

    ;; Clear status - derived from stacking relations
    (clear crate0) ; Nothing on crate0
    (not (clear crate1)) ; crate2 is on crate1
    (clear crate2) ; Nothing on crate2
    (not (clear pallet0)) ; crate1 is on pallet0
    (clear pallet1) ; Nothing on pallet1
    (not (clear pallet2)) ; crate0 is on pallet2
    (clear pallet3) ; Nothing on pallet3

    ;; Initial negations (inferred from problem statement)
    (not (lifting hoist0 crate0)) (not (lifting hoist0 crate1)) (not (lifting hoist0 crate2))
    (not (lifting hoist1 crate0)) (not (lifting hoist1 crate1)) (not (lifting hoist1 crate2))
    (not (lifting hoist2 crate0)) (not (lifting hoist2 crate1)) (not (lifting hoist2 crate2))
    (not (lifting hoist3 crate0)) (not (lifting hoist3 crate1)) (not (lifting hoist3 crate2))

    (not (in crate0 truck0)) (not (in crate0 truck1)) (not (in crate0 truck2))
    (not (in crate1 truck0)) (not (in crate1 truck1)) (not (in crate1 truck2))
    (not (in crate2 truck0)) (not (in crate2 truck1)) (not (in crate2 truck2))
  )
  (:goal
    (and
      (on crate0 crate2)
      (on crate1 pallet2)
      (on crate2 pallet1)
    )
  )
)