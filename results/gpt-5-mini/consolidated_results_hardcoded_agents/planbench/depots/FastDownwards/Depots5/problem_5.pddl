(define (problem deliver-crates)
  (:domain multiagent-hoist-truck)

  (:objects
    ;; places (only those actually relevant)
    depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces (only pallets used)
    pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; single truck sufficient for deliveries in this instance
    truck2 - truck

    ;; hoists present at useful locations
    hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; initial entity locations (minimal)
    (at-truck truck2 depot1)

    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; stacking at distributor0: pallet3 <- crate0 <- crate1 <- crate2
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; clear facts: crate2 top, destination pallets empty
    (clear crate2)
    (clear pallet1)
    (clear pallet2)

    ;; hoist availability (only those present)
    (available hoist1)
    (available hoist2)
    (available hoist3)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)