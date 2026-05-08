(define (problem depots12)
  (:domain depots-instance)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks locations
    (at_truck truck0 depot1)
    (at_truck truck1 depot0)
    (at_truck truck2 depot1)

    ;; hoists locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; pallets locations (surfaces)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; crates locations (as surface objects at places)
    (at_surface crate0 depot2)
    (at_surface crate1 distributor0)
    (at_surface crate2 distributor0)

    ;; stacking (which crate/pallet supports which crate)
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 crate1)

    ;; clear surfaces / crates (those that have nothing on them)
    (clear crate0)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)