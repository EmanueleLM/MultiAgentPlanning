(define (problem stack-red-yellow-orange)
  (:domain blocks-order-staged)
  (:objects
    red orange yellow blue - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; initial placement
    (on yellow blue)
    (ontable blue)
    (ontable red)
    (ontable orange)

    ;; clear facts (a block is clear iff nothing is on top and it is not held)
    (clear yellow)
    (clear red)
    (clear orange)

    ;; hand and stage ordering (single current stage ensures strict forward progression)
    (handempty)
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