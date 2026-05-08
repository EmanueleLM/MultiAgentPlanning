(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; explicit discrete stages to enforce ordering / time progression
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - stage
  )

  (:init
    ;; Temporal staging: initial stage and linear successor chain.
    (current-stage s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11)

    ;; Connectivity (roads) - symmetric assertions
    (connected depot0 depot1) (connected depot1 depot0)
    (connected depot0 depot2) (connected depot2 depot0)
    (connected depot0 distributor0) (connected distributor0 depot0)
    (connected depot1 depot2) (connected depot2 depot1)
    (connected depot1 distributor0) (connected distributor0 depot1)
    (connected depot2 distributor0) (connected distributor0 depot2)

    ;; Initial locations: hoists
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; Initial locations: trucks
    (at-truck truck0 depot0)
    (at-truck truck1 depot2)
    (at-truck truck2 distributor0)

    ;; Initial locations: pallets (surfaces)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; Initial locations: crates (surfaces)
    (at-surface crate0 depot0)
    (at-surface crate1 depot0)
    (at-surface crate2 depot2)

    ;; Stacking relationships
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; Hoists initially available
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear facts for topmost surfaces/crates
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet1)
  ))
)