(define (problem depots46)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; crate absolute locations (also specified via on-surface relations below)
    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 depot1)

    ;; crate on pallet relations
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet1)

    ;; surface and crate clearance (crate clear means nothing on top of it)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; hoist locations and availability
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; truck locations
    (at truck0 depot0)
    (at truck1 depot2)
    (at truck2 depot2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet3)
    (on crate2 pallet2)
  ))
)