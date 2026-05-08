(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    hoist0 hoist1 hoist2 hoist3 - hoist

    truck0 truck1 truck2 - truck

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate
  )

  (:init
    ;; places for objects
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 depot0)

    ;; crates initially at places (also on surfaces as specified)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot2)

    ;; stacking relations (a crate on a surface)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear predicates as given
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate2 crate0)
  ))
)