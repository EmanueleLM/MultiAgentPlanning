(define (problem logistics-stacking-problem)
  (:domain logistics-stacking)
  (:objects
    ;; Places
    depot0 depot1 depot2 distributor0 - place

    ;; Trucks
    truck0 truck1 truck2 - truck

    ;; Hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; Crates (also treated as objects that can act as surfaces)
    crate0 crate1 crate2 - crate

    ;; Pallets (treated as objects that can act as surfaces)
    pallet0 pallet2 pallet3 - pallet
  )

  (:init
    ;; Adjacency (complete connectivity among listed places as per planner analysis)
    (adjacent depot0 depot1) (adjacent depot1 depot0)
    (adjacent depot0 depot2) (adjacent depot2 depot0)
    (adjacent depot0 distributor0) (adjacent distributor0 depot0)
    (adjacent depot1 depot2) (adjacent depot2 depot1)
    (adjacent depot1 distributor0) (adjacent distributor0 depot1)
    (adjacent depot2 distributor0) (adjacent distributor0 depot2)

    ;; Initial truck locations (driver analysis)
    (at truck0 depot2)
    (at truck1 depot0)
    (at truck2 depot2)

    ;; Initial hoist locations and availability (hoist analysis)
    (at hoist0 depot0)
    (hoist_available hoist0)
    (at hoist1 depot1)
    (hoist_available hoist1)
    (at hoist2 depot2)
    (hoist_available hoist2)
    (at hoist3 distributor0)
    (hoist_available hoist3)

    ;; Pallets locations
    (at pallet0 depot0)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crates initial placements (on pallets) and clear on top
    (at crate0 depot0)
    (on crate0 pallet0)
    (clear crate0)

    (at crate1 distributor0)
    (on crate1 pallet3)
    (clear crate1)

    (at crate2 depot2)
    (on crate2 pallet2)
    (clear crate2)

    ;; Important bookkeeping invariants are enforced by operator preconditions/effects:
    ;; - crates that are on surfaces are represented by both (at crate place) and (on crate surface)
    ;; - clear(surface) is true iff no crate is on that surface (initially pallets with crates are not marked clear)
    ;; No explicit clear facts for pallets that have crates (so pallet0/pallet2/pallet3 are not clear).
  )

  (:goal (and
    ;; Global goal: final stacking configuration (must be achieved exactly)
    (on crate0 crate2)
    (on crate1 pallet2)
    (on crate2 pallet0)
  ))