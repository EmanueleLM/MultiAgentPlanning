(define (problem move-crate-problem)
  (:domain orchestrated-logistics)
  (:objects
    truck1 - truck
    hoist1 - hoist
    crate1 - crate
    locA locB - location
  )

  (:init
    ;; initial positions
    (at crate1 locA)
    (at-truck truck1 locA)
    (at-hoist hoist1 locA)

    ;; hoist initially free
    (hoist-free hoist1)

    ;; designate areas
    (loading-area locA)
    (placement-area locB)

    ;; connectivity (bidirectional roads)
    (road locA locB)
    (road locB locA)
  )

  ;; Goal: crate must be placed at the placement area (final terminal condition)
  (:goal (and
           (placed crate1)
         ))
)