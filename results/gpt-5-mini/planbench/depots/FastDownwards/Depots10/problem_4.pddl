(define (problem depots10-prob)
  (:domain depots10)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces / pallets and crates (crates are also surfaces for stacking)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; trucks and hoists
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; pallet locations (surfaces)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; crate locations and stacking (crates are treated as surfaces for at_surface)
    (at_surface crate0 depot1)
    (on crate0 pallet1)

    (at_surface crate1 depot1)
    (on crate1 crate0)

    (at_surface crate2 depot0)
    (on crate2 pallet0)

    ;; hoist locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; truck locations
    (at_truck truck0 depot2)
    (at_truck truck1 distributor0)
    (at_truck truck2 depot1)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear / surface-clear facts
    (clear crate1)            ;; nothing on top of crate1
    (clear crate2)

    (surface_clear pallet2)
    (surface_clear pallet3)
    ;; pallet0 and pallet1 are not surface_clear because they have crates on them
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
)