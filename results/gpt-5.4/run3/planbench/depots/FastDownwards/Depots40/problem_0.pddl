(define (problem depots_instance_problem)
  (:domain depots_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate
  )

  (:init
    (road depot0 depot1)
    (road depot0 depot2)
    (road depot0 distributor0)
    (road depot1 depot0)
    (road depot1 depot2)
    (road depot1 distributor0)
    (road depot2 depot0)
    (road depot2 depot1)
    (road depot2 distributor0)
    (road distributor0 depot0)
    (road distributor0 depot1)
    (road distributor0 depot2)

    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    (at-truck truck0 depot0)
    (at-truck truck1 depot2)
    (at-truck truck2 depot1)

    (at-crate crate0 distributor0)
    (at-crate crate1 distributor0)
    (at-crate crate2 depot1)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)

    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)
  )

  (:goal
    (and
      (on crate0 pallet1)
      (on crate1 pallet3)
      (on crate2 pallet2)
    )
  )
)