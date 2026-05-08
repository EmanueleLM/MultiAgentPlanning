(define (problem BlocksworldScaling6-problem)
  (:domain BlocksworldScaling6)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    ;; spatial relations
    (ontable red)
    (ontable orange)
    (on blue yellow)
    (on yellow orange)

    ;; clear means no blocks above and not being held
    (clear red)
    (clear blue)

    ;; single hand initially empty
    (handempty)

    ;; discrete ordered stages; actions must move current along these successors
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)

    ;; initial current stage
    (current s0)
  )
  (:goal
    (and
      (on blue red)
      (on orange blue)
      (current s6)
    )
  )
)