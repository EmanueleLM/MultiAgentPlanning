(define (problem depots48_problem)
  (:domain depots48)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; places of crates (represented via surface_at for surfaces/crates)
    (surface_at crate0 depot0)
    (surface_at crate1 depot2)
    (surface_at crate2 depot0)

    ;; hoist locations
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    ;; pallets at places
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; trucks at places
    (truck_at truck0 depot2)
    (truck_at truck1 depot2)
    (truck_at truck2 depot0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear surfaces (no object on top)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; stacking relations (on top)
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 crate0)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet2)
    (on crate2 crate0)
  ))
)