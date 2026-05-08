(define (problem depots11-problem)
  (:domain depots11-hoist)
  (:objects
    ;; crates and pallets
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor
  )

  (:init
    ;; hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; truck locations
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clearance facts (explicitly provided)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    (clear pallet3)

    ;; stacking initial configuration (bottom -> top)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; explicit crate locations (consistent with the stacking above)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot0)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate2)
    (on crate2 pallet0)
  ))
)