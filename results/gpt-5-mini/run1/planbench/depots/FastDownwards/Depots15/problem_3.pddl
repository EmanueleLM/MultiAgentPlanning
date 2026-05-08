(define (problem multiagent_hoist_truck_prob)
  (:domain multiagent_hoist_truck)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    (at_truck truck0 depot2)
    (at_truck truck1 depot2)
    (at_truck truck2 depot1)

    (on crate0 pallet2)
    (on crate1 pallet1)
    (on crate2 crate0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear_crate crate1)
    (clear_crate crate2)

    (clear_surface pallet0)
    (clear_surface pallet3)

    (truck_free truck0)
    (truck_free truck1)
    (truck_free truck2)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 crate2)
    (on crate2 pallet2)
  ))
)