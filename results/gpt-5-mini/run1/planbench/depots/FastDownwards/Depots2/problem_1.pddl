(define (problem depots2)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; places of pallets
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; initial stacking: crate0 on pallet2 at depot2; crate2 on crate0; crate1 on pallet0 at depot0
    (on crate0 pallet2)
    (at_surface crate0 depot2)

    (on crate2 crate0)
    (at_surface crate2 depot2)

    (on crate1 pallet0)
    (at_surface crate1 depot0)

    ;; clear facts: surfaces/crates with nothing on top
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
    ;; note: pallet0 and pallet2 are not clear because they have crates on them;
    ;; crate0 is not clear because crate2 is on it.

    ;; hoist locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; truck locations
    (at_truck truck0 depot2)
    (at_truck truck1 depot0)
    (at_truck truck2 depot2)
  )

  (:goal (and
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)