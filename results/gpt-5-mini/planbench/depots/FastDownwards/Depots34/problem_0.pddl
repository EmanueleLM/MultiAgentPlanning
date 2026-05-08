(define (problem jack_of_all_trades_problem)
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
    ;; places of crates (as provided)
    (at crate0 depot2)
    (at crate1 depot2)
    (at crate2 depot2)

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
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 depot0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear top surfaces initially (as given)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)

    ;; stacking/on relations (initial stack at depot2)
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)
  )

  (:goal (and
    (on crate0 crate2)
    (on crate2 pallet1)
  ))
)