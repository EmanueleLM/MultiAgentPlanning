(define (problem depots1-prob)
  (:domain depots1)
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces: pallets and crates
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; hoist locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; truck locations
    (truck-at truck0 depot0)
    (truck-at truck1 depot1)
    (truck-at truck2 depot0)

    ;; surface locations (pallets)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crates are surfaces too: their location corresponds to the place they rest at
    (surface-at crate0 depot0)
    (surface-at crate1 depot0)
    (surface-at crate2 depot2)

    ;; stacking relations
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; clear predicates (top of surface free)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; Note: pallet0, crate0, and pallet2 are not clear due to crates on them
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 crate0)
  ))
)