(define (problem jack_instance)
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
    ;; crates at places
    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 depot2)

    ;; hoists at places
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks at places
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot1)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear surfaces/crates
    (clear crate0)
    (clear crate2)
    (clear pallet0)
    (clear pallet3)

    ;; stacking relations (and implicit co-located at facts above)
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 crate1)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet2)
  ))
)