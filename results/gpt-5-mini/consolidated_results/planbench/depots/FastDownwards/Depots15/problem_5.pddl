(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )

  (:init
    ;; stage ordering and initial stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (current-stage s0)

    ;; pallets locations
    (at-surf pallet0 depot0)
    (at-surf pallet1 depot1)
    (at-surf pallet2 depot2)
    (at-surf pallet3 distributor0)

    ;; trucks locations
    (at-truck truck0 depot2)
    (at-truck truck1 depot2)
    (at-truck truck2 depot1)

    ;; hoists locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; initial stacking and crate locations
    (on crate0 pallet2)
    (at-surf crate0 depot2)

    (on crate1 pallet1)
    (at-surf crate1 depot1)

    (on crate2 crate0)
    (at-surf crate2 depot2)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear/top-status consistent with above stacks
    (clear pallet0)
    (clear pallet3)
    (clear crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet3)
    (at-surf crate0 distributor0)

    (on crate2 pallet2)
    (at-surf crate2 depot2)

    (on crate1 crate2)
    (at-surf crate1 depot2)
  ))
)