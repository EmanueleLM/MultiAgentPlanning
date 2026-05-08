(define (problem move-cargo-with-hoist)
  (:domain logistics-hoist-truck)
  (:objects
    tr1 - truck
    h1 - hoist
    c1 - cargo
    locA locB - location
  )

  (:init
    ;; initial positions
    (truck-at tr1 locA)
    (hoist-at h1 locA)
    (cargo-at c1 locA)

    ;; hoist initially free
    (hoist-free h1)

    ;; explicit connectivity (bidirectional if both listed)
    (connected locA locB)
    (connected locB locA)
  )

  ;; Goals require cargo delivered to locB, truck located at locB, and hoist ends free.
  (:goal (and
    (cargo-at c1 locB)
    (truck-at tr1 locB)
    (hoist-free h1)
  ))
)