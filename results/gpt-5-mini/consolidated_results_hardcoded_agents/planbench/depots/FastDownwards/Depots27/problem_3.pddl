(define (problem depots27-problem)
  (:domain depots27)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    ;; discrete stages for explicit ordering
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    ;; place of pallets (surfaces)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates initial on surfaces (stacking)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; crates located at places as well (must reflect surface locations)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot1)

    ;; hoists and trucks locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot1)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; initial clearance: only top-most surfaces/crates that are not covered are clear
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; stage ordering and initial current stage
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
    (succ stage6 stage7)
    (succ stage7 stage8)
    (succ stage8 stage9)
    (succ stage9 stage10)
    (succ stage10 stage11)
    (succ stage11 stage12)
    (succ stage12 stage13)
    (succ stage13 stage14)
    (succ stage14 stage15)

    (current-stage stage0)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
  ))