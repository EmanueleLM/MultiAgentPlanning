(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; places (only those needed for the goal)
    depot0 depot1 - depot

    ;; surfaces (only pallets and crates needed)
    pallet0 pallet1 - pallet
    crate0 crate1 - crate

    ;; hoists (only those at depot0 and depot1)
    hoist0 hoist1 - hoist

    ;; trucks (only the truck initially at depot0)
    truck0 - truck
  )

  (:init
    ;; Locations: hoists
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)

    ;; Location: truck
    (at-truck truck0 depot0)

    ;; Pallets locations
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)

    ;; Crates are represented by stacking relations (no separate at-surface facts for crates)
    (on crate0 pallet0)
    (on crate1 crate0)

    ;; Hoists initially available
    (available hoist0)
    (available hoist1)

    ;; clear facts only for topmost surfaces/crates needed initially
    (clear crate1)
    (clear pallet1)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet1)
  ))
)