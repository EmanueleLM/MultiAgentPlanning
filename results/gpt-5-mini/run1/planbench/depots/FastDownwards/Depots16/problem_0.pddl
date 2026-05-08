(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    ;; places (depots are subtypes of place)
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; vehicles and hoists
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; place-type tokens for place_type predicate
    ptype-depot ptype-distributor - place-type
  )

  (:init
    ;; place typing facts (explicit place_type as required)
    (place_type depot0 ptype-depot)
    (place_type depot1 ptype-depot)
    (place_type depot2 ptype-depot)
    (place_type distributor0 ptype-distributor)

    ;; connectivity: Assumption A1 - all depots/distributors mutually reachable (directed)
    ;; reachable facts among all four places (excluding self-loops)
    (reachable depot0 depot1)
    (reachable depot0 depot2)
    (reachable depot0 distributor0)
    (reachable depot1 depot0)
    (reachable depot1 depot2)
    (reachable depot1 distributor0)
    (reachable depot2 depot0)
    (reachable depot2 depot1)
    (reachable depot2 distributor0)
    (reachable distributor0 depot0)
    (reachable distributor0 depot1)
    (reachable distributor0 depot2)

    ;; initial truck locations (unique)
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; hoist locations
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; pallets at places (surface-at)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crates initial placements and surface locations
    ;; crate0 on pallet0 at depot0
    (on crate0 pallet0)
    (crate-at crate0 depot0)
    (surface-at crate0 depot0)   ;; crate0 can act as a surface (located at depot0)

    ;; crate2 on crate0 at depot0
    (on crate2 crate0)
    (crate-at crate2 depot0)
    (surface-at crate2 depot0)   ;; crate2 is at depot0 as well; even if used as a surface, maintain surface-at

    ;; crate1 on pallet2 at depot2
    (on crate1 pallet2)
    (crate-at crate1 depot2)
    (surface-at crate1 depot2)

    ;; clear predicates per provided initial facts
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; Note: pallet0 is not clear initially (crate0 on it). pallet2 not clear (crate1 on it).
    ;; crate0 is not clear initially (crate2 on crate0).

    ;; Ensure no crates in trucks initially
    ;; (No in-truck facts)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)
  ))
)