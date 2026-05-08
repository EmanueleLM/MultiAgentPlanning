(define (problem jack_instance_01)
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
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 depot0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; crates at places and on pallets, crates are clear (nothing on top)
    (at crate0 depot0)
    (on crate0 pallet0)
    (clear crate0)

    (at crate1 depot2)
    (on crate1 pallet2)
    (clear crate1)

    (at crate2 distributor0)
    (on crate2 pallet3)
    (clear crate2)

    ;; pallet clears (only pallet1 is explicitly clear initially)
    (clear pallet1)
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet2)
    (on crate2 pallet1)
  ))
)