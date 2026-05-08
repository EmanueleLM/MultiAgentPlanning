(define (problem move-crates-to-target-pallets)
  (:domain depots5)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )

  (:init
    ;; roads (trucks can drive between any two depots or distributor)
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)

    ;; initial locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot1)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 distributor0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; stacking (crate2 top of stack)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; clear surfaces (topmost items and empty pallets)
    (clear pallet0)
    (clear pallet1)
    (clear pallet2)
    (clear crate2)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)