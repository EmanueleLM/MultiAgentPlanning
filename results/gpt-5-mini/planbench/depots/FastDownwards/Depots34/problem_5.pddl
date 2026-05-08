(define (problem depots34_instance)
  (:domain depots_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; surfaces (pallets and crates) locations
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    (at_surface crate0 depot2)
    (at_surface crate1 depot2)
    (at_surface crate2 depot2)

    ;; hoist and truck locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (at_truck truck0 depot1)
    (at_truck truck1 depot1)
    (at_truck truck2 depot0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear surfaces (nothing on top)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)

    ;; stacking relations (top-to-bottom)
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)
  )

  (:goal (and
    (on crate0 crate2)
    (on crate2 pallet1)
  ))
)