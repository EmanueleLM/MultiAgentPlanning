(define (problem depot-hoist-problem)
  (:domain depot-hoist)
  (:objects
    ;; agents
    depot1 hoist1 - agent

    ;; crates
    crate1 crate2 - crate

    ;; pallets
    pallet1 pallet2 - pallet

    ;; places
    storage hoist_platform pallet_area1 pallet_area2 - place
  )

  (:init
    ;; Agent roles and initial locations
    (depot-operator depot1)
    (hoist-operator hoist1)

    (agent-at depot1 storage)
    (agent-at hoist1 hoist_platform)

    ;; Crates start in storage
    (at crate1 storage)
    (at crate2 storage)

    ;; Pallets located in their areas and initially empty
    (pallet-at pallet1 pallet_area1)
    (pallet-at pallet2 pallet_area2)
    (pallet-empty pallet1)
    (pallet-empty pallet2)
  )

  ;; Goal: place crate1 on pallet1 and crate2 on pallet2.
  ;; These terminal conditions are required; no post-hoc penalties or tokens allowed.
  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)