(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; hoists locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; trucks locations
    (at truck0 depot1)
    (at truck1 depot0)
    (at truck2 distributor0)

    ;; pallets locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates initial locations (consistent with their being on supporting surfaces)
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 distributor0)

    ;; stacking: crate0 on pallet3, crate1 on crate0, crate2 on crate1
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; clearness facts (top of stacks and empty pallets)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet2)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)