(define (problem depot_instance_problem)
  (:domain depot_instance)

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

    (at_crate crate0 depot0)
    (at_crate crate1 depot1)
    (at_crate crate2 depot1)

    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)
    (at_surface crate0 depot0)
    (at_surface crate1 depot1)
    (at_surface crate2 depot1)

    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (at_truck truck0 depot2)
    (at_truck truck1 depot2)
    (at_truck truck2 depot1)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate0)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 crate1)
  )

  (:goal
    (and
      (on crate0 pallet2)
      (on crate2 pallet0)
    )
  )
)