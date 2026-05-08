(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; surfaces
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; vehicles and hoists
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; place-type tokens (kept for explicit typing if needed)
    ptype-depot ptype-distributor - place_type
  )

  (:init
    ;; place typing facts
    (place_type depot0 ptype-depot)
    (place_type depot1 ptype-depot)
    (place_type depot2 ptype-depot)
    (place_type distributor0 ptype-distributor)

    ;; full connectivity among places (roads connect any two places)
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

    ;; initial truck locations
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

    ;; pallets at places
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crate placements
    ;; crate0 on pallet0 at depot0
    (on crate0 pallet0)
    (crate-at crate0 depot0)
    (surface-at crate0 depot0)

    ;; crate2 on crate0 at depot0
    (on crate2 crate0)
    (crate-at crate2 depot0)
    (surface-at crate2 depot0)

    ;; crate1 on pallet2 at depot2
    (on crate1 pallet2)
    (crate-at crate1 depot2)
    (surface-at crate1 depot2)

    ;; clear predicates (from provided facts)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; Note: pallet0 and pallet2 are not clear initially. crate0 is not clear initially.
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)
  ))
)