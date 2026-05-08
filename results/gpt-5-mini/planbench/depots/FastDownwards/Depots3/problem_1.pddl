(define (problem depot-orchestration-problem)
  (:domain depot-orchestration)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; surfaces / pallets
    pallet0 pallet1 pallet2 pallet3 - surface

    ;; crates
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; surfaces located at places (pallets are static in this model)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates on their initial pallets (gives crate implicit location via surface location)
    (on crate0 pallet2)   ; crate0 at depot2 (pallet2)
    (on crate1 pallet3)   ; crate1 at distributor0 (pallet3)
    (on crate2 pallet1)   ; crate2 at depot1 (pallet1)

    ;; crate-level clearance (no stacking in initial state)
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ;; surface clearance: only pallet0 is free initially
    (clear-surface pallet0)
    ;; pallet1, pallet2, pallet3 are occupied initially (no clear-surface facts)

    ;; hoists location and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; trucks all start at depot1
    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 depot1)
  )

  (:goal (and
    ;; final placement requirements (strict constraints)
    (on crate0 pallet0)   ; crate0 must end up on pallet0 at depot0
    (on crate1 pallet1)   ; crate1 must end up on pallet1 at depot1
    (on crate2 pallet3)   ; crate2 must end up on pallet3 at distributor0
  ))
)