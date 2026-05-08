(define (problem stack-red-yellow-orange)
  (:domain blocks-order-staged)
  (:objects
    red orange yellow blue - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; initial block configuration
    (on yellow blue)
    (ontable blue)
    (ontable red)
    (ontable orange)

    ;; clear status: red, orange, yellow are clear; blue is not clear because yellow is on it
    (clear red)
    (clear orange)
    (clear yellow)
    (handempty)

    ;; staging (discrete time): start at s0 and provide a linear chain of successors
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