(define (problem logistics_problem)
  (:domain logistics_domain)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 - truck
    truck2 - truck
    hoist0 hoist1 hoist2 - hoist
    hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 - pallet
    pallet3 - pallet
  )
  (:init
    (at crate0 distributor0)
    (at crate1 depot1)
    (at crate2 distributor0)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot2)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
    (on crate0 pallet3)
    (on crate1 pallet1)
    (on crate2 crate0)
  )
  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 crate1)
  ))
)