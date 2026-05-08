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
    ;; surfaces (pallets) at places
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; hoists at places
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; trucks at places
    (at_truck truck0 distributor0)
    (at_truck truck1 depot2)
    (at_truck truck2 depot0)

    ;; crates initial positions (crates are also surfaces)
    (at_surface crate0 distributor0)
    (on crate0 pallet3)

    (at_surface crate1 distributor0)
    (on crate1 crate0)

    (at_surface crate2 depot2)
    (on crate2 pallet2)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear surfaces (top-of-surface clear) as stated
    (clear pallet0)
    (clear pallet1)
    (clear crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 crate2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)