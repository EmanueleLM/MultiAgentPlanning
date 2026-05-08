(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; crates initial place locations (also paired with on facts below)
    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 distributor0)

    ;; hoists locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallets locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks locations
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 depot0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear predicates (clear applied to surfaces/crates; crates are top-clear initially)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet1)

    ;; stacking (crate on pallet implies crate and pallet at same place)
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)
  )
  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet2)
    (on crate2 pallet1)
  ))
)