(define (problem depots12-problem)
  (:domain depots12)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets and crates (pallet and crate are subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; trucks and hoists
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; positions: trucks
    (at_truck truck0 depot1)
    (at_truck truck1 depot0)
    (at_truck truck2 depot1)

    ;; positions: hoists
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; pallets at places (surfaces)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; crates initial stacking and positions (crate is a surface as well)
    (on crate0 pallet2)
    (at_surface crate0 depot2)

    (on crate1 pallet3)
    (at_surface crate1 distributor0)

    (on crate2 crate1)
    (at_surface crate2 distributor0)

    ;; clear surfaces/crates as given
    (clear crate0)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; connectivity: trucks can drive between any two depots/distributors (fully connected)
    (connected depot0 depot1)
    (connected depot0 depot2)
    (connected depot0 distributor0)
    (connected depot1 depot0)
    (connected depot1 depot2)
    (connected depot1 distributor0)
    (connected depot2 depot0)
    (connected depot2 depot1)
    (connected depot2 distributor0)
    (connected distributor0 depot0)
    (connected distributor0 depot1)
    (connected distributor0 depot2)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)