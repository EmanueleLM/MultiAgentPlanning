(define (problem depots13-prob)
  (:domain depots13)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 - stage
  )

  (:init
    ;; trucks and hoists at their initial places
    (at-truck truck0 depot2)
    (at-truck truck1 distributor0)
    (at-truck truck2 distributor0)

    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; static surfaces (pallets) at places
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; initial crate placements on surfaces
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)

    ;; top-of-surface clear facts initially where applicable
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; hoists are free initially
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; linear stage ordering
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

    ;; start stage
    (current-stage stage0)
  )

  (:goal (and
    (on crate0 pallet1)   ; crate0 must be on pallet1
    (on crate2 crate0)    ; crate2 must be on top of crate0
    (current-stage stage11) ; require reaching the terminal stage explicitly
  ))
)