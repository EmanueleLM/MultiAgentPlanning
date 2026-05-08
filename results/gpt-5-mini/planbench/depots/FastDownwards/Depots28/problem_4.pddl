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

    ;; pallets located at places
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; initial stacking (from the specification)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; top-of-surface clear facts as given
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
  )

  (:goal (and
    (on crate2 pallet0)
    (on crate0 crate2)
    (on crate1 crate0)
  ))
)