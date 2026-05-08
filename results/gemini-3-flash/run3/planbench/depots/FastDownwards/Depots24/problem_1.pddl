(define (problem depots24_prob)
  (:domain depots24)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; Locations of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (clear pallet1)

    ;; Locations of trucks
    (at truck0 depot2)
    (at truck1 depot0)
    (at truck2 depot2)

    ;; Initial crate states
    (at crate0 depot0)
    (on crate0 pallet0)
    (clear crate0)

    (at crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)

    (at crate2 depot2)
    (on crate2 pallet2)
    (clear crate2)
  )
  (:goal
    (and
      (on crate0 crate2)
      (on crate1 pallet2)
      (on crate2 pallet0)
    )
  )
)