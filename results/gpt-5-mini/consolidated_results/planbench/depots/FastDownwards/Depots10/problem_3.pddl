(define (problem depots10-prob)
  (:domain depots10)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; discrete stages for sequencing (enough stages for feasible plans)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 stage16 - stage
  )

  (:init
    ;; surface locations (pallets)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crate locations (each crate is itself a surface object when at a place)
    (surface-at crate0 depot1)
    (surface-at crate1 depot1)
    (surface-at crate2 depot0)

    ;; truck and hoist locations
    (truck-at truck0 depot2)
    (truck-at truck1 distributor0)
    (truck-at truck2 depot1)

    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; stacking relations (crate on surface)
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)

    ;; clear surfaces / crates (those with nothing on them)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; stage ordering and initial active stage
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
    (next stage4 stage5)
    (next stage5 stage6)
    (next stage6 stage7)
    (next stage7 stage8)
    (next stage8 stage9)
    (next stage9 stage10)
    (next stage10 stage11)
    (next stage11 stage12)
    (next stage12 stage13)
    (next stage13 stage14)
    (next stage14 stage15)
    (next stage15 stage16)

    (at-stage stage0)
  )

  (:goal (and
           (on crate0 pallet2)
           (on crate1 pallet0)
           (on crate2 pallet1)
         ))
)