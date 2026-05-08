(define (problem depots20-problem)
  (:domain depots20)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; road connectivity: depots and distributors are directly connected in both directions
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)

    ;; initial locations
    (crate-at crate0 depot1)
    (crate-at crate1 depot2)
    (crate-at crate2 depot0)

    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (truck-at truck0 depot1)
    (truck-at truck1 depot2)
    (truck-at truck2 distributor0)

    ;; stacking: crates are on pallets initially
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 pallet0)

    ;; clear flags (explicit as given)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; hoists initially available
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
  )

  (:goal
    (and
      ;; desired final stacking state
      (on crate0 pallet2)
      (on crate1 pallet1)
      (on crate2 pallet0)
    )
  )
)