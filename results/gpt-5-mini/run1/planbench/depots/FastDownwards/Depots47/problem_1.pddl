(define (problem depots47)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; crates initial locations
    (at crate0 depot2)
    (at crate1 depot1)
    (at crate2 depot0)

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
    (at truck0 distributor0)
    (at truck1 depot1)
    (at truck2 distributor0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear surfaces as given
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; stacking
    (on crate0 pallet2)
    (on crate1 pallet1)
    (on crate2 pallet0)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)