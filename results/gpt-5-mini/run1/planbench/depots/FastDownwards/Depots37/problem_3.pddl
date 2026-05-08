(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks at places
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; hoists at places and available
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates at places (kept consistent with stacking facts)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 distributor0)

    ;; stacking relations
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet3)

    ;; clearance facts
    (clear pallet1)
    (clear pallet2)
    (clear crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
)