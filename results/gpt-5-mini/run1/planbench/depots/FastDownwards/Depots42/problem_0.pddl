(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; crates at places (also implied by stacking)
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 distributor0)

    ;; stacking / on relations (topology of stacks)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; clear surfaces (positive facts only)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet2)

    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; hoists at places and available
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)

    ;; trucks at places
    (at truck0 depot1)
    (at truck1 depot0)
    (at truck2 distributor0)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)