(define (problem depots_instance_problem)
  (:domain depots_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    crate0 crate1 crate2 - crate

    pallet0 pallet1 pallet2 pallet3 - pallet
  )

  (:init
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    (at_crate crate0 depot1)
    (at_crate crate1 depot0)
    (at_crate crate2 distributor0)

    (at_surface crate0 depot1)
    (at_surface crate1 depot0)
    (at_surface crate2 distributor0)

    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)

    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (at_truck truck0 distributor0)
    (at_truck truck1 distributor0)
    (at_truck truck2 depot0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)

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
  )

  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 pallet0)
      (on crate2 pallet1)
      (at_crate crate0 distributor0)
      (at_crate crate1 depot0)
      (at_crate crate2 depot1)
    )
  )
)