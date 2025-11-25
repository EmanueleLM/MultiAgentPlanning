(define (problem BlocksworldScaling1-problem)
  (:domain BlocksworldScaling1)
  (:objects
    blue yellow red orange - block
    s0 s1 s2 s3 s4 s5 - stage
  )

  (:init
    ;; block configuration
    (on red orange)
    (on yellow red)
    (ontable blue)
    (ontable orange)

    ;; clear predicates (no block on top and not held)
    (clear blue)
    (clear yellow)

    ;; hand status
    (handempty)

    ;; stage initialization
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
  )

  (:goal (and
    (on red orange)
    (on blue yellow)
    (on yellow red)
  ))
)