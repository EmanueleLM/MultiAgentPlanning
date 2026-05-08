(define (problem relocate-crates)
  (:domain hoist-truck-domain)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates (also surfaces)
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; At facts: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; At facts: pallets (surfaces)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; At facts: crates (location mirrors support locations)
    (at crate0 depot2)
    (at crate1 depot1)
    (at crate2 depot2)

    ;; At facts: trucks
    (at truck0 depot2)
    (at truck1 depot2)
    (at truck2 depot1)

    ;; On (direct support) relations (initial stacking)
    (on crate0 pallet2)
    (on crate1 pallet1)
    (on crate2 crate0)

    ;; Hoists initially available
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Clear facts (no object directly on top)
    ;; crate1 has nothing on top; crate2 has nothing on top; pallet0 and pallet3 empty
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet3)

    ;; Note: crate0 is not clear (crate2 on top), pallet1 not clear (crate1 on top),
    ;; pallet2 not clear (crate0 on top). There are no 'in' or 'holding' facts initially.
  )

  (:goal (and
    ;; final arrangement must be exact direct-on relations
    (on crate0 pallet3)
    (on crate1 crate2)
    (on crate2 pallet2)
  ))
)