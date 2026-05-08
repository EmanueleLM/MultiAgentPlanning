(define (problem jack_instance_01)
  (:domain jack_of_all_trades_instance)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations: trucks
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; locations: pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crate placements and stacking
    (at crate0 depot2)
    (at crate1 distributor0)
    (at crate2 depot2)

    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 crate0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear facts (only those stated as clear initially)
    (clear pallet0)
    (clear pallet1)
    (clear crate1)
    (clear crate2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet1)
  ))
)