(define (problem depots10-prob)
  (:domain depots10)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; surfaces: pallets and crates (crate is a subtype of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; surface locations (pallets and crates locations)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    (surface-at crate0 depot1)
    (surface-at crate1 depot1)
    (surface-at crate2 depot0)

    ;; truck and hoist locations
    (truck-at truck0 depot2)
    (truck-at truck1 distributor0)
    (truck-at truck2 depot1)

    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; stacking relations (crate on surface)
    (on crate0 pallet1)
    (on crate1 crate0)
    (on crate2 pallet0)

    ;; clear surfaces/ crates (those with nothing on them)
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)
  )

  (:goal (and
           (on crate0 pallet2)
           (on crate1 pallet0)
           (on crate2 pallet1)
         ))
)