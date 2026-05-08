(define (problem jack_of_all_trades-instance)
  (:domain jack_of_all_trades)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; crates at places (also consistent with on facts)
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 depot1)

    ;; hoists at places
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks at places
    (at truck0 depot0)
    (at truck1 depot2)
    (at truck2 depot1)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear facts as provided (only those explicitly stated)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)

    ;; stacking relations as provided
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 pallet2)
  ))
)