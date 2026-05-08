(define (problem depots17)
  (:domain depots-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0

    ;; crates
    crate0 crate1 crate2

    ;; pallets
    pallet0 pallet1 pallet2 pallet3

    ;; trucks
    truck0 truck1 truck2

    ;; hoists
    hoist0 hoist1 hoist2 hoist3
  )

  (:init
    ;; locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; initial positions of trucks
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 distributor0)

    ;; initial positions of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; crates: both "at" (place) and "on" (support) are maintained
    (at crate0 distributor0)
    (on crate0 pallet3)

    (at crate1 distributor0)
    (on crate1 crate0)

    (at crate2 depot1)
    (on crate2 pallet1)

    ;; hoists available
    (free-hoist hoist0)
    (free-hoist hoist1)
    (free-hoist hoist2)
    (free-hoist hoist3)

    ;; clear status: positive facts only (absence means not clear)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
  )

  (:goal (and
           (on crate0 pallet0)
           (on crate1 pallet2)
           (on crate2 pallet3)
         ))
)