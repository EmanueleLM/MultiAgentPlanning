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
    ;; crates initial places
    (at crate0 depot1)
    (at crate1 depot1)
    (at crate2 distributor0)

    ;; stacking relations
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet3)

    ;; clear facts as given
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)

    ;; hoists initial locations and availability
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; pallets initial locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks initial locations
    (at truck0 distributor0)
    (at truck1 depot1)
    (at truck2 depot2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 crate2)
    (on crate2 pallet3)
  ))
)