(define (problem Depots0)
  (:domain depots)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; surfaces (pallets) locations
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; stacking relations (directly on)
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)

    ;; clear surfaces (nothing on top)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; hoist and truck locations and availability
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    (at_truck truck0 depot1)
    (at_truck truck1 depot1)
    (at_truck truck2 distributor0)
  )

  (:goal (and
           (on crate1 pallet1)
           (on crate2 pallet3)
         ))
)