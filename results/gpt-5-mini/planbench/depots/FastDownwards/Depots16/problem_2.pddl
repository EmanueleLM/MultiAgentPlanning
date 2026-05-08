(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates (also surfaces)
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Place membership (pallets and crates and hoists and trucks located at places)
    ;; Pallets at their places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crates initial locations (they are also surfaces placed on other surfaces)
    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 depot0)

    ;; On-relations (stacking)
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 crate0)

    ;; Hoists and trucks at places
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; Hoists availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Clear predicates (nothing on top)
    ;; crate1 and crate2 are marked clear initially as provided
    (clear crate1)
    (clear crate2)
    ;; pallet1 and pallet3 are specified clear in public facts
    (clear pallet1)
    (clear pallet3)
    ;; NOTE: pallet0 is not listed as clear because crate0 rests on pallet0; crate0 is not clear because crate2 is on it.

    ;; Reachability among depots and distributors: fully connected among these place types (all ordered pairs, excluding self-pairs).
    ;; Explicitly list connectivity for every pair of distinct places
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

    ;; Ordering constraints enforced as hard preconditions:
    ;; The specification required that truck0 must be loaded before it drives from depot0 to depot2,
    ;; and truck2 must be loaded before it drives from depot2 to depot0.
    ;; We encode this by preventing drives for these trucks until a load into them occurs.
    (must-be-loaded truck0)
    (must-be-loaded truck2)
  )

  (:goal (and
    ;; final stacking goals
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)
  ))
)