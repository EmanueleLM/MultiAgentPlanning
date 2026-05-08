(define (problem depots11)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Hoists positions and availability
    (at_hoist hoist0 depot0)
    (available hoist0)
    (at_hoist hoist1 depot1)
    (available hoist1)
    (at_hoist hoist2 depot2)
    (available hoist2)
    (at_hoist hoist3 distributor0)
    (available hoist3)

    ;; Trucks positions
    (at_truck truck0 distributor0)
    (at_truck truck1 depot0)
    (at_truck truck2 depot0)

    ;; Pallets positions and initial clear status
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (clear pallet1)
    (at_surface pallet2 depot2)
    (clear pallet2)
    (at_surface pallet3 distributor0)
    (clear pallet3)

    ;; Crates positions, on-relations, and initial clear status
    (at_surface crate0 depot0)
    (on crate0 pallet0)
    
    (at_surface crate1 depot0)
    (on crate1 crate0)
    
    (at_surface crate2 depot0)
    (on crate2 crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate2)
    (on crate2 pallet0)
  ))
)