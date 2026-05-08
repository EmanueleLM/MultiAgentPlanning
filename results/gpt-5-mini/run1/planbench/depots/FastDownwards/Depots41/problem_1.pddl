(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; initial locations of pallets (surfaces)
    (at_surface pallet0 depot0)
    (at_surface pallet1 depot1)
    (at_surface pallet2 depot2)
    (at_surface pallet3 distributor0)

    ;; initial locations of crates (crates are also surfaces)
    (at_surface crate0 depot1)
    (at_surface crate1 depot0)
    (at_surface crate2 distributor0)

    ;; initial on relations (stacking)
    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)

    ;; hoists locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; trucks locations
    (at_truck truck0 distributor0)
    (at_truck truck1 distributor0)
    (at_truck truck2 depot0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear predicates (explicitly stated)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    ;; pallet0, pallet1, pallet3 are not clear because they have crates on them
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
)