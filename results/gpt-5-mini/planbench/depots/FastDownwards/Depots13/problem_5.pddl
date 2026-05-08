(define (problem depots13-instance)
  (:domain depot-operations)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; pallets located at places
    (pallet-at pallet0 depot0)
    (pallet-at pallet1 depot1)
    (pallet-at pallet2 depot2)
    (pallet-at pallet3 distributor0)

    ;; crates initially on pallets and crates located at same places
    (on crate0 pallet2)
    (crate-at crate0 depot2)

    (on crate1 pallet0)
    (crate-at crate1 depot0)

    (on crate2 pallet1)
    (crate-at crate2 depot1)

    ;; trucks initial locations
    (truck-at truck0 depot2)
    (truck-at truck1 distributor0)
    (truck-at truck2 distributor0)

    ;; hoists initial locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; hoists are available
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; clear surfaces: crates have nothing on top initially; pallet3 is empty
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate2 crate0)
  ))
)