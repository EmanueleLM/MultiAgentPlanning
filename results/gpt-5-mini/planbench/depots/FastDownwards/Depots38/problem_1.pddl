(define (problem jack_of_all_trades_problem)
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
    ;; crates locations and stacking
    (at crate0 depot0)
    (on crate0 pallet0)
    (at crate1 depot0)
    (on crate1 crate0)
    (at crate2 depot2)
    (on crate2 pallet2)

    ;; pallets locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; hoists locations and availability
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; trucks locations
    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 depot0)

    ;; clear surfaces/crates (explicit from statement)
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