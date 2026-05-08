(define (problem depots22-instance)
  (:domain depots-hoist)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )

  (:init
    ;; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; pallet clear status (only pallet0 is clear initially)
    (clear pallet0)

    ;; crates are on pallets and at places (as stated)
    (on crate0 pallet1)
    (at crate0 depot1)
    (clear crate0)

    (on crate1 pallet2)
    (at crate1 depot2)
    (clear crate1)

    (on crate2 pallet3)
    (at crate2 distributor0)
    (clear crate2)

    ;; hoists at places and available
    (hoist-at hoist0 depot0)
    (available hoist0)

    (hoist-at hoist1 depot1)
    (available hoist1)

    (hoist-at hoist2 depot2)
    (available hoist2)

    (hoist-at hoist3 distributor0)
    (available hoist3)

    ;; trucks at places
    (truck-at truck0 distributor0)
    (truck-at truck1 depot1)
    (truck-at truck2 depot1)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet0)
  ))
)