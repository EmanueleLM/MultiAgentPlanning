(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ; initial locations (places for crates and surfaces, and vehicles/tools)
    (at crate0 depot2)
    (at crate1 depot2)
    (at crate2 depot2)

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 depot0)

    ; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ; clear surfaces/crates
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)

    ; stacking: crate0 on pallet2, crate1 on crate0, crate2 on crate1
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)
  )

  (:goal (and
    (on crate0 crate2)
    (on crate2 pallet1)
  ))
)