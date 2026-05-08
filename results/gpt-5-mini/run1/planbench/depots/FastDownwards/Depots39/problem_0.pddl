(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; truck locations
    (at_truck truck0 depot1)
    (at_truck truck1 depot0)
    (at_truck truck2 depot2)

    ;; hoist locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; pallet locations
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; crate locations (at places)
    (at_surface crate0 depot1)
    (at_surface crate1 depot2)
    (at_surface crate2 depot2)

    ;; stacking relations
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 crate1)

    ;; clear facts
    (clear crate0)
    (clear crate2)
    (clear pallet0)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 crate0)
  ))
)