(define (problem stack-red-yellow-orange)
  (:domain blocks-order-staged)
  (:objects
    red orange yellow blue - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; placements
    (on yellow blue)
    (ontable blue)
    (ontable red)
    (ontable orange)

    ;; clear facts (no block on top of these)
    (clear yellow)
    (clear red)
    (clear orange)

    ;; hand state
    (handempty)

    ;; explicit staged progression: actions require the current stage and advance it via next links.
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  (:goal
    (and
      (on red yellow)
      (on orange red)
    )
  )
)