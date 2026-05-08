(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; surfaces
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; initial locations of crates (crates are at places because they sit on surfaces at those places)
    (at crate0 depot1)
    (at crate1 depot0)
    (at crate2 distributor0)

    ;; initial on relations (stacking)
    (on crate0 pallet1)
    (on crate1 pallet0)
    (on crate2 pallet3)

    ;; locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; hoists locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; trucks locations
    (at truck0 distributor0)
    (at truck1 distributor0)
    (at truck2 depot0)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; clear predicates (explicitly stated and implied)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet2)

    ;; Note: pallet0, pallet1, pallet3 are not clear initially because they have crates on them
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
)