(define (problem depots13-prob)
  (:domain depots13)
  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - surface
    top0 top1 top2 - surface

    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 - stage
  )

  (:init
    ;; place role annotations
    (is-depot depot0)
    (is-depot depot1)
    (is-depot depot2)
    (is-distributor distributor0)

    ;; truck and hoist locations
    (at-truck truck0 depot2)
    (at-truck truck1 distributor0)
    (at-truck truck2 distributor0)

    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; static surfaces (pallets) locations
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; top surfaces of crates (static association)
    (surface-of top0 crate0)
    (surface-of top1 crate1)
    (surface-of top2 crate2)

    ;; initial crate placements
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)

    ;; clear top surfaces of crates initially (no crate stacked on top)
    (clear top0)
    (clear top1)
    (clear top2)
    ;; pallet3 is clear initially
    (clear pallet3)

    ;; hoists are free initially
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; stage ordering (linear progression)
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

    ;; initial current stage
    (current-stage stage0)
  )

  (:goal (and
    (on crate0 pallet1)   ; crate0 must be on pallet1
    (on crate2 top0)      ; crate2 must be on the top surface of crate0 (top0)
    (current-stage stage11) ; enforce that plan reaches final stage explicitly
  ))
)