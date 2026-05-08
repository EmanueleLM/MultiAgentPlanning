(define (problem depots6-problem)
  (:domain depots6)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    ;; place supertype is implicit via depot/distributor
  )

  (:init
    ;; places of trucks
    (at-truck truck0 distributor0)
    (at-truck truck1 distributor0)
    (at-truck truck2 depot2)

    ;; hoists locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; surfaces (pallets) locations
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates initial placement (also as surfaces at places)
    (at-surface crate0 depot2)
    (on crate0 pallet2)

    (at-surface crate1 depot0)
    (on crate1 pallet0)

    (at-surface crate2 depot0)
    (on crate2 crate1)

    ;; clear facts (nothing on top)
    (clear crate0)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; hoists free
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)
  )

  (:goal (and
    (on crate0 crate2)
    (on crate1 pallet2)
    (on crate2 pallet1)
  ))
)