(define (problem depot-orchestration-problem)
  (:domain depot-orchestrator)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - surface

    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; Surface locations
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; Crates on surfaces (one-slot surfaces)
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)

    ;; Surface clearance: only pallet0 is empty initially
    (clear-surface pallet0)
    ;; pallet1, pallet2, pallet3 are occupied (no clear-surface facts)

    ;; Crate clearance (no crate has another crate on top)
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ;; Trucks initial locations
    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 depot1)

    ;; Hoists at their places and initially available
    (at-hoist hoist0 depot0)
    (available hoist0)

    (at-hoist hoist1 depot1)
    (available hoist1)

    (at-hoist hoist2 depot2)
    (available hoist2)

    (at-hoist hoist3 distributor0)
    (available hoist3)
  )

  (:goal (and
    ;; Final required placements (hard constraints)
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)
  ))
)