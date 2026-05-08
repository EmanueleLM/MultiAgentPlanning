(define (problem depots_23)
  (:domain depots_logistics)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at truck0 distributor0)
    (at truck1 depot1)
    (at truck2 distributor0)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet3)
    (clear crate1)
    (clear pallet1)
    (clear pallet2)
    (clear crate2)
    ;; Inferred non-clear statuses for consistency
    ;; pallet0 is not clear because crate0 is on it
    ;; crate0 is not clear because crate1 is on it
    ;; pallet3 is not clear because crate2 is on it
  )
  (:goal
    (and
      (on crate0 pallet2)
      (on crate1 crate0)
      (on crate2 pallet0)
    )
  )
)