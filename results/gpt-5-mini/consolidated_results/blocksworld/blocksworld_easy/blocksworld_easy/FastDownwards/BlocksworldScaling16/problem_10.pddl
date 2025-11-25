(define (problem bw-multiagent-instance)
  (:domain blocksworld-multiagent)
  (:objects
    blue yellow orange red - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; initial locations
    (ontable blue)
    (ontable yellow)
    (ontable red)
    (on orange red)

    ;; clear/hand status as provided
    (clear blue)
    (clear orange)
    (clear yellow)
    (handempty)

    ;; contiguous stage progression and initial current stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (current s0)
  )
  (:goal (and
           (on blue orange)
           (on yellow blue)
         ))
)