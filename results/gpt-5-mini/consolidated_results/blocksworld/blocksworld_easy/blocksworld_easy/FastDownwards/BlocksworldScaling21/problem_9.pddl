(define (problem blocks-problem-01-staged)
  (:domain blocks-single-handed-staged)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; Spatial relations
    (on orange yellow)
    (ontable red)
    (ontable blue)
    (ontable yellow)

    ;; Clear and hand state (clear means no block on top and not held)
    (clear red)
    (clear blue)
    (clear orange)
    (handempty)

    ;; Stage progression: single current stage and a strict successor chain
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )
  (:goal (and
    (on blue yellow)
    (on orange red)
    (handempty)
  ))
)