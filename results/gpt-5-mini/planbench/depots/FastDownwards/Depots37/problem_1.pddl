(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; crate locations (crates are also objects that can be 'at' a place when not lifted)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 distributor0)

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
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear surfaces / crates (those that have nothing on top)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)

    ;; stacking relationships
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet3)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
)