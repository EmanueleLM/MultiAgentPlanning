(define (problem BlocksworldScaling1-problem)
  (:domain BlocksworldScaling1)
  (:objects
    blue yellow red orange - block
    s0 s1 s2 s3 s4 s5 - stage
  )

  (:init
    ;; stacking relations
    (on red orange)
    (on yellow red)
    ;; table occupancy
    (ontable blue)
    (ontable orange)
    ;; clear blocks (no block on top and not held)
    (clear blue)
    (clear yellow)
    ;; hand state
    (handempty)
    ;; stage progression (discrete contiguous stages)
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