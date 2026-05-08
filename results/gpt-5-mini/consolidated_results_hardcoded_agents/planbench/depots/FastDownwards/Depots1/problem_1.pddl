(define (problem Depots1-prob)
  (:domain Depots1)
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces: pallets and crates (crates are also surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; Hoist locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; Truck locations
    (truck-at truck0 depot0)
    (truck-at truck1 depot1)
    (truck-at truck2 depot0)

    ;; Surface locations (pallets)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; Crates initial positions and surface-location facts (crates are surfaces too)
    (at crate0 depot0)
    (surface-at crate0 depot0)
    (at crate1 depot0)
    (surface-at crate1 depot0)
    (at crate2 depot2)
    (surface-at crate2 depot2)

    ;; On relations (stacking)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; Clear predicates (top of surface free)
    ;; crate1 and crate2 and pallet1 and pallet3 are initially clear per specification
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; Note: pallet0 and crate0 and pallet2 are not clear because they have crates on them
  )

  (:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 crate0)
  ))
)