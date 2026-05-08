(define (problem stacking-problem)
  (:domain hoist-stacking)
  (:objects
    ;; crates and pallets
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    ;; locations (depots and distributors are locations)
    depot0 depot1 depot2 distributor0 - location

    ;; explicit discrete stages for ordering (enforces a strict linear progression of actions)
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 - stage
  )

  (:init
    ;; initial locations of crates (when on supports, they are at the location implicitly via the support location)
    ;; We include explicit at facts for crates that are at places because they rest on supports at those places.
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot0)

    ;; hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; truck empty flags (capacity modeled explicitly = 1)
    (truck-empty truck0)
    (truck-empty truck1)
    (truck-empty truck2)

    ;; clear/top-of-stack facts (only those given are true)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    (clear pallet3)

    ;; stacking relations as given
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; staging: start at stage0 and define successor chain
    (current stage0)
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
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate2)
    (on crate2 pallet0)
  ))
)