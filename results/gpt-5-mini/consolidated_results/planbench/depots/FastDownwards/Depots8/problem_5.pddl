(define (problem load-and-deliver)
  (:domain depot-distributor)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; stages for explicit ordered progression (7 stages to allow up to 6 actions)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 - stage
  )

  (:init
    ;; stage ordering and initial active stage
    (stage_next stage0 stage1)
    (stage_next stage1 stage2)
    (stage_next stage2 stage3)
    (stage_next stage3 stage4)
    (stage_next stage4 stage5)
    (stage_next stage5 stage6)
    (stage_now stage0)

    ;; fixed surface locations for pallets
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; crate0 is a supporting surface at depot1 (it currently has crate2 on it)
    (surface_at crate0 depot1)

    ;; initial stacking relationships
    (crate_on_surface crate0 pallet1)
    (crate_on_surface crate1 pallet3)
    (crate_on_surface crate2 crate0)

    ;; explicitly known clear surfaces/objects (minimal necessary set)
    (surface_clear pallet0)  ;; destination pallet free
    (surface_clear pallet2)
    (surface_clear crate2)   ;; crate2 is top of its stack

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
  )

  (:goal (and
    ;; Goal: crate0 on pallet0 and crate2 on pallet1
    (crate_on_surface crate0 pallet0)
    (crate_on_surface crate2 pallet1)
  ))
)