(define (problem depots1)
  (:domain depots_transport)

  (:objects
    ; places
    depot0 depot1 depot2 distributor0 - place

    ; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ; trucks
    truck0 truck1 truck2 - truck

    ; surfaces: pallets and crates (both typed surface)
    pallet0 pallet1 pallet2 pallet3 crate0 crate1 crate2 - surface
  )

  (:init
    ; hoist locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ; truck locations
    (at_truck truck0 depot0)
    (at_truck truck1 depot1)
    (at_truck truck2 depot0)

    ; surfaces (pallets) at places
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ; crates are surfaces too; record their place-location
    (at_surface crate0 depot0)
    (at_surface crate1 depot0)
    (at_surface crate2 depot2)

    ; stacking relations: which surface supports which crate
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ; hoist availability
    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ; clear surfaces (nothing on top)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ; implicit: pallet0 and crate0 are not clear because they support other items (no predicate needed)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 crate0)
  ))
)