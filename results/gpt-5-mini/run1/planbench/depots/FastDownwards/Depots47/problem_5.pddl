(define (problem depots47)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; crates initial locations (also expressed on their pallets)
    (at_surface crate0 depot2)
    (at_surface crate1 depot1)
    (at_surface crate2 depot0)

    ;; hoists locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; pallets locations
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; trucks locations
    (at_truck truck0 distributor0)
    (at_truck truck1 depot1)
    (at_truck truck2 distributor0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear surfaces as given (surfaces include crates and pallets)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; stacking
    (on crate0 pallet2)
    (on crate1 pallet1)
    (on crate2 pallet0)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)