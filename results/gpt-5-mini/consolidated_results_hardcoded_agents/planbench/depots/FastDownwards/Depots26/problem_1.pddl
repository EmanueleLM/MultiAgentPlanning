(define (problem move-crates)
  (:domain transport-hoists-trucks)

  (:objects
    ;; Places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; Surfaces: pallets and crates (both are surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; Trucks
    truck0 truck1 truck2 - truck

    ;; Hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; Surface locations (pallets)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; Crates are surfaces too and initially located at their places
    (surface-at crate0 depot0)
    (surface-at crate1 depot1)
    (surface-at crate2 distributor0)

    ;; Crates on top of surfaces (top-of-surface)
    (crate-on crate0 pallet0)
    (crate-on crate1 pallet1)
    (crate-on crate2 pallet3)

    ;; Surface clearances: only pallet2 is initially clear
    (surface-clear pallet2)

    ;; Crate clear (no crate stacked on top of these crates)
    (crate-clear crate0)
    (crate-clear crate1)
    (crate-clear crate2)

    ;; Truck locations
    (truck-at truck0 depot0)
    (truck-at truck1 depot1)
    (truck-at truck2 depot0)

    ;; Hoist locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; Hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Road connectivity: complete connectivity among different places (no self-links)
    (road depot0 depot1)
    (road depot0 depot2)
    (road depot0 distributor0)
    (road depot1 depot0)
    (road depot1 depot2)
    (road depot1 distributor0)
    (road depot2 depot0)
    (road depot2 depot1)
    (road depot2 distributor0)
    (road distributor0 depot0)
    (road distributor0 depot1)
    (road distributor0 depot2)
  )

  (:goal (and
    (crate-on crate0 pallet2)
    (crate-on crate1 pallet3)
    (crate-on crate2 pallet1)
  ))
)