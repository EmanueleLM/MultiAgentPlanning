(define (problem deliver-crates)
  (:domain multiagent-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; linear stages to enforce strict ordering (one action per stage)
    st0 st1 st2 st3 st4 st5 st6 st7 st8 st9 st10 st11 - stage
  )

  (:init
    ;; roads (bidirectional)
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)

    ;; initial entity locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot1)

    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    (at-surface crate0 distributor0)
    (at-surface crate1 distributor0)
    (at-surface crate2 distributor0)

    ;; stacking at distributor0: pallet3 <- crate0 <- crate1 <- crate2
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; clear facts: crate2 top, destination pallets empty
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet2)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; stage chain (linear ordering)
    (succ st0 st1)
    (succ st1 st2)
    (succ st2 st3)
    (succ st3 st4)
    (succ st4 st5)
    (succ st5 st6)
    (succ st6 st7)
    (succ st7 st8)
    (succ st8 st9)
    (succ st9 st10)
    (succ st10 st11)

    ;; start at st0
    (current-stage st0)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)