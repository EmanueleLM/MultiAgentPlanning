(define (problem logistics-hoist-truck-problem)
  (:domain logistics-hoist-truck)

  (:objects
    ;; locations
    dock1 site1 - location

    ;; equipment and items
    h1 - hoist
    t1 - truck
    c1 c2 - crate
  )

  (:init
    ;; initial object locations
    (at-crate c1 dock1)
    (at-crate c2 dock1)

    (at-hoist h1 dock1)
    (at-truck t1 dock1)

    ;; initial states
    (hoist-free h1)
    (truck-empty t1)
  )

  ;; Goals: all crates at site1 and both handling resources returned free/empty
  (:goal (and
           (at-crate c1 site1)
           (at-crate c2 site1)
           (hoist-free h1)
           (truck-empty t1)
         )
  )
)