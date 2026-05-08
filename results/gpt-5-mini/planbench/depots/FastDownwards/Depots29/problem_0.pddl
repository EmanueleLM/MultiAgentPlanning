(define (problem depot-hoist-audited-problem)
  (:domain depot-hoist-audited)

  (:objects
    ;; crates and pallets
    crate1 crate2 - crate
    pallet1 pallet2 - pallet

    ;; locations: storage locations and pallet pads
    store1 store2 pad1 pad2 - location

    ;; single hoist device
    hoist1 - device

    ;; agents
    hoistop depotop - agent
  )

  ;; initial state: explicit positions and roles; mapping targets; hoist free; crates at stores; pallets at pads
  (:init
    ;; locations
    (hoist-at hoist1 store1)
    (hoist-free hoist1)

    (at crate1 store1)
    (at crate2 store2)

    (at-pallet pallet1 pad1)
    (at-pallet pallet2 pad2)

    ;; operators' starting positions and roles
    (operator-at hoistop store1)
    (hoist-operator hoistop)

    (operator-at depotop pad1)
    (depot-operator depotop)

    ;; target mapping: strict constraint that each crate must go to its assigned pallet
    (target crate1 pallet1)
    (target crate2 pallet2)
  )

  ;; goal: both crates must be on their assigned pallets (terminal conditions are fully specified)
  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)