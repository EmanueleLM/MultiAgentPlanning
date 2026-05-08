(define (problem load-and-deliver)
  (:domain depot-distributor)

  (:objects
    ;; locations
    depot0 depot1 depot2 distributor0 - location

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; discrete steps for explicit ordering (reduced)
    step0 step1 step2 step3 step4 step5 step6 step7 step8 - step
  )

  (:init
    ;; surface locations for pallets (fixed)
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; crate0 is a supporting surface at depot1 (it currently has crate2 on it)
    (surface_at crate0 depot1)

    ;; initial stacking relationships (only what's necessary)
    (crate_on_surface crate0 pallet1)
    (crate_on_surface crate1 pallet3)
    (crate_on_surface crate2 crate0)

    ;; explicit clear facts only for surfaces that are known clear initially
    (surface_clear pallet0)
    (surface_clear pallet2)
    (surface_clear crate2)    ;; crate2 is top of its stack

    ;; crate-level clear markers required for lift preconditions
    (crate_clear crate1)
    (crate_clear crate2)

    ;; hoists locations and availability
    (hoist_at hoist0 depot0)
    (hoist_at hoist1 depot1)
    (hoist_at hoist2 depot2)
    (hoist_at hoist3 distributor0)

    (hoist_free hoist0)
    (hoist_free hoist1)
    (hoist_free hoist2)
    (hoist_free hoist3)

    ;; trucks locations
    (truck_at truck0 depot1)
    (truck_at truck1 depot2)
    (truck_at truck2 distributor0)

    ;; stage ordering (succession relation) -- shortened sequence
    (next step0 step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
    (next step4 step5)
    (next step5 step6)
    (next step6 step7)
    (next step7 step8)

    ;; initial current stage
    (current step0)
  )

  (:goal (and
    ;; Goal: crate0 on pallet0 and crate2 on pallet1
    (crate_on_surface crate0 pallet0)
    (crate_on_surface crate2 pallet1)
  ))
)