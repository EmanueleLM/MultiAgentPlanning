(define (problem depots0-problem)
  (:domain depots-ordered-stages)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate

    ;; ordered stages (horizon sufficient for sequential actions)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    ;; ordered stages and initial current stage token
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
    (now stage0)

    ;; initial locations of pallets and crates
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    (at-crate crate0 depot1)
    (at-crate crate1 depot1)
    (at-crate crate2 depot0)

    ;; hoist positions
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; truck positions
    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 distributor0)

    ;; on (direct) relations as given in the initial statement
    (on-crate-pallet crate0 pallet1)
    (on-crate-crate crate1 crate0)
    (on-crate-pallet crate2 pallet0)

    ;; clear flags as given
    (clear-crate crate1)
    (clear-crate crate2)
    (clear-pallet pallet2)
    (clear-pallet pallet3)

    ;; hoists initially free (available)
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)
  )

  (:goal (and
    (on-crate-pallet crate1 pallet1)
    (on-crate-pallet crate2 pallet3)
  ))
)