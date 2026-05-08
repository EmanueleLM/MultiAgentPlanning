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
    ;; truck locations
    (at-truck truck0 depot2)
    (at-truck truck1 depot2)
    (at-truck truck2 depot0)

    ;; hoist locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; surfaces (pallets) locations
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crate locations (crates are also surfaces)
    (at-surface crate0 distributor0)
    (at-surface crate1 depot0)
    (at-surface crate2 depot2)

    ;; clear facts (as given)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet1)

    ;; support (on) relations
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 pallet2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 crate1)
  ))
)