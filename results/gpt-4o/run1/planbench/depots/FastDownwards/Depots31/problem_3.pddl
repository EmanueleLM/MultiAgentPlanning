(define (problem logistics_problem)
  (:domain logistics)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    (at crate0 depot1)
    (on crate0 pallet1)
    (clear crate1)
    (at crate1 depot1)
    (on crate1 crate0)
    (clear crate2)
    (at crate2 distributor0)
    (on crate2 pallet3)

    (at hoist0 depot0)
    (hoist_available hoist0)
    (at hoist1 depot1)
    (hoist_available hoist1)
    (at hoist2 depot2)
    (hoist_available hoist2)
    (at hoist3 distributor0)
    (hoist_available hoist3)

    (at truck0 distributor0)
    (at truck1 depot1)
    (at truck2 depot2)

    (at pallet0 depot0)
    (clear pallet0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (clear pallet2)
    (at pallet3 distributor0)
  )
  (:goal (and
    (on crate0 pallet0)
    (on crate1 crate2)
    (on crate2 pallet3)
  ))
)