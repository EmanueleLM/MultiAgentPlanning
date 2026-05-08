(define (problem logistics-instance)
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
    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 depot2)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at truck0 depot1)
    (at truck1 depot0)
    (at truck2 depot2)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate0)
    (clear pallet0)
    (clear pallet3)
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 crate1)
  )
  (:goal
    (and
      (on crate0 pallet1)
      (on crate1 crate2)  ;; For syncing with a plausible intermediary state
      (on crate2 crate1)  
    )
  )
)