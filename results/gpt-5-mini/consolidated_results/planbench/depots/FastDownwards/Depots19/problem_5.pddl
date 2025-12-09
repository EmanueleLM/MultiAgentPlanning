(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; minimal places needed for the goal
    depot0 depot1 - depot

    ;; surfaces: only the pallets and crates involved in the goal/initially stacked
    pallet0 pallet1 - pallet
    crate0 crate1 - crate

    ;; only the hoists and truck that are used
    hoist0 hoist1 - hoist
    truck0 - truck
  )

  (:init
    ;; hoist and truck locations (only those required)
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-truck truck0 depot0)

    ;; surfaces located at places (include crate0 because other crate is on it)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface crate0 depot0)

    ;; stacking relations
    (on crate0 pallet0)
    (on crate1 crate0)

    ;; hoists available
    (available hoist0)
    (available hoist1)

    ;; only topmost clear surfaces that are needed initially
    (clear crate1)
    (clear pallet1)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet1)
  ))
)