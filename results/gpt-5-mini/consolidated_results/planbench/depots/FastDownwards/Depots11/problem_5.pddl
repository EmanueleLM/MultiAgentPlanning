(define (problem stacking-problem)
  (:domain hoist-stacking)
  (:objects
    ;; crates and pallets
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    ;; places: depots and distributors (subtypes of place)
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; explicit discrete stages for strict linear progression of actions
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9
    stage10 stage11 stage12 stage13 stage14 - stage
  )

  (:init
    ;; initial locations (crates recorded at their place even when stacked)
    (at-crate crate0 depot0)
    (at-crate crate1 depot0)
    (at-crate crate2 depot0)

    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    (at-truck truck0 distributor0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; truck empty flags (explicit capacity enforcement)
    (truck-empty truck0)
    (truck-empty truck1)
    (truck-empty truck2)

    ;; clear/top-of-stack facts (only those given are true initially)
    (clear-crate crate2)
    (clear-pallet pallet1)
    (clear-pallet pallet2)
    (clear-pallet pallet3)

    ;; stacking relations as given
    (on-pallet crate0 pallet0)
    (on-crate crate1 crate0)
    (on-crate crate2 crate1)

    ;; staging: start at stage0 and successor chain enforces contiguous action occupancy
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
    (succ stage10 stage11)
    (succ stage11 stage12)
    (succ stage12 stage13)
    (succ stage13 stage14)
  )

  (:goal (and
    (on-pallet crate0 pallet1)
    (on-crate crate1 crate2)
    (on-pallet crate2 pallet0)
  ))
)