(define (problem stack-blue-yellow)
  (:domain block-stacking)

  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 - time
  )

  (:init
    ;; stacking and table facts
    (on red yellow)
    (on blue orange)
    (ontable orange)
    (ontable yellow)

    ;; clearance: red and blue have nothing on top and are not held
    (clear red)
    (clear blue)

    ;; hand is free initially
    (handempty)

    ;; starting stage/time marker and contiguous successor relation
    (at s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )

  (:goal (and
    (on blue orange)
    (on yellow blue)
    (at s4)
  ))
)