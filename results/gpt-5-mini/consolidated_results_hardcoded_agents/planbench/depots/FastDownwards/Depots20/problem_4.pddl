(define (problem depots-revised-problem)
  (:domain depots-revised)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; crates and pallets (pallets and crates are surfaces)
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )

  (:init
    ;; surface locations (pallets at places)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crate stacking (initial)
    (on crate0 pallet1)
    (crate-clear crate0)

    (on crate1 pallet2)
    (crate-clear crate1)

    (on crate2 pallet0)
    (crate-clear crate2)

    ;; hoist and truck locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (truck-at truck0 depot1)
    (truck-at truck1 depot2)
    (truck-at truck2 distributor0)

    ;; hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; only pallet3 is initially clear (others have crates atop)
    (surface-clear pallet3)
  )

  (:goal
    (and
      ;; terminal placement goals exactly as specified
      (on crate0 pallet2)
      (on crate1 pallet1)
      (on crate2 pallet0)
    )
  )
)