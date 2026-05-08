(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place
    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
    ;; trucks
    truck0 truck1 truck2 - truck
    ;; pallets and crates (pallets and crates are surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Roads: complete graph among all places (both directions)
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)

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
    (truck-at truck1 depot2)
    (truck-at truck2 distributor0)

    ;; Surfaces (pallets at places)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; Crates present at places (crates are surfaces too)
    (surface-at crate0 depot0)
    (surface-at crate1 depot0)
    (surface-at crate2 depot2)

    ;; Initial stacking (on relations)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; Clear predicates (no crate on top)
    ;; crate1 has nothing on top; crate2 has nothing on top; pallet1 and pallet3 empty
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; Ensure primitives absent where expected (no hoist-lifting, no in-truck initially)
    ;; (Implicitly false by default in PDDL)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet1)
  ))
)