(define (problem hoist-ops-instance)
  (:domain hoist-operations)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; locations: pallets (surfaces)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; trucks locations
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot0)

    ;; stacking: crates on pallets
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)

    ;; crate top tokens: crates are top-of-stack
    (clear_top crate0)
    (clear_top crate1)
    (clear_top crate2)

    ;; pallet2 is empty and thus top
    (clear_top pallet2)

    ;; hoists are available initially
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; crates are unclaimed initially
    (unclaimed crate0)
    (unclaimed crate1)
    (unclaimed crate2)

    ;; NOTE: crates have implicit place via on(...)+at(surface,place). The original instance also listed crate "at" facts;
    ;; those per-crate at facts are not required by this domain when on(...) relations plus surface at(...) define crate location.
    ;; If a planner requires explicit at facts for crates when they are not in-truck, it may derive them from the on+at relation.
  )

  (:goal (and
    ;; desired final stacking
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)