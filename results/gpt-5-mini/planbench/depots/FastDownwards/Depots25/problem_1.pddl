(define (problem depots25_instance)
  (:domain depots25)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; Hoist and truck locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (truck-at truck0 distributor0)
    (truck-at truck1 depot1)
    (truck-at truck2 distributor0)

    ;; Hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Surfaces (pallets) at places
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; Crates located at depot2 (on pallet2 -> also at depot2)
    (surface-at crate0 depot2)
    (surface-at crate1 depot2)
    (surface-at crate2 depot2)

    ;; Stacking: crate0 on pallet2, crate1 on crate0, crate2 on crate1
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; Clear surfaces: top-most crate(s) and empty pallets listed as clear
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal (and
           (on crate1 crate2)
           (on crate2 pallet2)
         ))
)