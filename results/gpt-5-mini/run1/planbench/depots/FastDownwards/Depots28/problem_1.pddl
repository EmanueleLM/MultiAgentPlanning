(define (problem depots28-problem)
  (:domain depots28)
  (:objects
    depot0 depot1 depot2 distributor0
    truck0 truck1 truck2
    hoist0 hoist1 hoist2 hoist3
    pallet0 pallet1 pallet2 pallet3
    crate0 crate1 crate2
  )

  (:init
    ;; truck locations
    (truck-at truck0 depot1)
    (truck-at truck1 depot1)
    (truck-at truck2 depot0)

    ;; hoist locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; pallets and crates at places and stacking (positive facts only)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 depot1)

    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; clear/top facts (only those explicitly true)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
  )

  (:goal (and
    ;; desired final stacking: pallet0 <- crate2 <- crate0 <- crate1 (all at depot0)
    (at pallet0 depot0)
    (at crate2 depot0)
    (at crate0 depot0)
    (at crate1 depot0)

    (on crate2 pallet0)
    (on crate0 crate2)
    (on crate1 crate0)
  ))
)