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

    ;; ordered stages (horizon chosen to allow a safe number of sequential steps)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 - stage
  )

  (:init
    ;; ordered stages and initial current stage
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
    (next stage4 stage5)
    (next stage5 stage6)
    (next stage6 stage7)
    (now stage0)

    ;; initial locations (pallets, crates, hoists, trucks)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at crate0 depot1)
    (at crate1 depot1)
    (at crate2 depot0)

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 distributor0)

    ;; surface relations as given
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)

    ;; clear flags (explicit from specification)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; hoists initially free
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet3)
  ))
)