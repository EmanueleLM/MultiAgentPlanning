(define (problem depots31-problem)
  (:domain depots31)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; surfaces (pallets) locations
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; crates initial places (each crate/surface also has a place)
    (at_surface crate0 depot1)
    (at_surface crate1 depot1)
    (at_surface crate2 distributor0)

    ;; stacking relations
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet3)

    ;; clear facts as given
    (clear_crate crate1)
    (clear_crate crate2)
    (clear_surface pallet0)
    (clear_surface pallet2)

    ;; hoists initial locations and availability
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; trucks initial locations
    (at_truck truck0 distributor0)
    (at_truck truck1 depot1)
    (at_truck truck2 depot2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 crate2)
    (on crate2 pallet3)
  ))
)