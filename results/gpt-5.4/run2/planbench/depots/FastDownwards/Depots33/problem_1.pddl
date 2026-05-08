(define (problem depots33_problem)
  (:domain depots33)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 depot2)

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)

    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet2)
  )

  (:goal
    (and
      (on crate0 crate2)
      (on crate1 pallet3)
      (on crate2 pallet1)
    )
  )
)