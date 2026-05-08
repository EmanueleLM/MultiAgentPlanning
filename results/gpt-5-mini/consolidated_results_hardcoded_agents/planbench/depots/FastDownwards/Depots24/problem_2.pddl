(define (problem logistics-instance-01)
  (:domain logistics_hoist_driving)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2                - crate

    truck0 truck1 truck2                - truck

    hoist0 hoist1 hoist2 hoist3         - hoist

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 - stage
  )

  (:init
    ;; current stage starts at s0
    (current s0)

    ;; successor (linear) relation for stages: enforce strict forward progression
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
    (succ s10 s11)
    (succ s11 s12)
    (succ s12 s13)
    (succ s13 s14)

    ;; Hoists and availability
    (at-hoist hoist0 depot0)
    (available hoist0)

    (at-hoist hoist1 depot1)
    (available hoist1)

    (at-hoist hoist2 depot2)
    (available hoist2)

    (at-hoist hoist3 distributor0)
    (available hoist3)

    ;; Surfaces (pallets) locations
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; Crates initial placements and clear status
    ;; crate0 on pallet0 at depot0
    (at-surface crate0 depot0)
    (on crate0 pallet0)
    (clear crate0)

    ;; crate2 on pallet2 at depot2
    (at-surface crate2 depot2)
    (on crate2 pallet2)
    (clear crate2)

    ;; crate1 on pallet3 at distributor0
    (at-surface crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)

    ;; pallet clear statuses: pallet1 is explicitly clear initially
    (clear pallet1)

    ;; Trucks initial positions
    (at-truck truck0 depot2)
    (at-truck truck1 depot0)
    (at-truck truck2 depot2)

    ;; Road connectivity (complete graph among listed places; bidirectional)
    (connected depot0 depot1)
    (connected depot1 depot0)
    (connected depot0 depot2)
    (connected depot2 depot0)
    (connected depot0 distributor0)
    (connected distributor0 depot0)
    (connected depot1 depot2)
    (connected depot2 depot1)
    (connected depot1 distributor0)
    (connected distributor0 depot1)
    (connected depot2 distributor0)
    (connected distributor0 depot2)
  )

  (:goal (and
           (on crate0 crate2)
           (on crate1 pallet2)
           (on crate2 pallet0)
         ))