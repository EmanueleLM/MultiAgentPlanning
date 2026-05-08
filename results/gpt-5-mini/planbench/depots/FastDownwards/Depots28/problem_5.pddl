(define (problem depots28)
  (:domain depots_hoist_drive)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks initial locations
    (at_truck truck0 depot1)
    (at_truck truck1 depot1)
    (at_truck truck2 depot0)

    ;; hoists initial locations and availability
    (at_hoist hoist0 depot0)
    (available hoist0)
    (at_hoist hoist1 depot1)
    (available hoist1)
    (at_hoist hoist2 depot2)
    (available hoist2)
    (at_hoist hoist3 distributor0)
    (available hoist3)

    ;; surfaces located at places (pallets)
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; initial stacking (from the specification)
    ;; crate0 on pallet3; crate1 on crate0; crate2 on pallet1
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; initial top-of-surface clear facts as given
    ;; crate1 and crate2 are clear (nothing on top of them)
    (clear crate1)
    (clear crate2)
    ;; pallet0 and pallet2 are clear (nothing on top of them)
    (clear pallet0)
    (clear pallet2)
    ;; note: pallet3 is not clear (crate0 on it), crate0 is not clear (crate1 on it), pallet1 is not clear (crate2 on it)
  )

  (:goal (and
    (on crate2 pallet0)
    (on crate0 crate2)
    (on crate1 crate0)
  ))
)