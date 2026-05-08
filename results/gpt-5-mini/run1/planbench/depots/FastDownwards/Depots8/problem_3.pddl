(define (problem depots8_problem)
  (:domain depots_hoist)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; surfaces (pallets) at places
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; crates are surfaces too; record their place presence and stacking (on)
    (on crate0 pallet1)
    (surface_at crate0 depot1)

    (on crate1 pallet3)
    (surface_at crate1 distributor0)

    (on crate2 crate0)
    (surface_at crate2 depot1)

    ;; trucks at places
    (truck_at truck0 depot1)
    (truck_at truck1 depot2)
    (truck_at truck2 distributor0)

    ;; hoists at places and available
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ;; clearance facts (surfaces with nothing on top)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate2 pallet1)
  ))