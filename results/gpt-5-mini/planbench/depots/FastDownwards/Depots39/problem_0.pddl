(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallet (surface) locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; truck locations
    (at truck0 depot1)
    (at truck1 depot0)
    (at truck2 depot2)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; crate locations and stacking (both on(...) and at(...) are asserted as given)
    (on crate0 pallet1)
    (at crate0 depot1)

    (on crate1 pallet2)
    (at crate1 depot2)

    (on crate2 crate1)
    (at crate2 depot2)

    ;; clear surfaces
    (clear crate0)
    (clear crate2)
    (clear pallet0)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 crate0)
  ))
)