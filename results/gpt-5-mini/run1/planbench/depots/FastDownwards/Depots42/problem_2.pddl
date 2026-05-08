(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    (at_surface crate0 distributor0)
    (at_surface crate1 distributor0)
    (at_surface crate2 distributor0)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet2)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)
    (at_hoist hoist0 depot0)
    (available hoist0)
    (at_hoist hoist1 depot1)
    (available hoist1)
    (at_hoist hoist2 depot2)
    (available hoist2)
    (at_hoist hoist3 distributor0)
    (available hoist3)
    (at_truck truck0 depot1)
    (at_truck truck1 depot0)
    (at_truck truck2 distributor0)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)