(define (problem bw-multiagent-instance)
  (:domain blocksworld-multiagent)
  (:objects
    blue yellow orange red - block
    table - table
  )
  (:init
    ;; initial locations
    (ontable blue)
    (ontable yellow)
    (ontable red)
    (on orange red)

    ;; clear/hand status (explicit as given)
    (clear blue)
    (clear orange)
    (clear yellow)
    (handempty)
  )
  (:goal (and
           (on blue orange)
           (on yellow blue)
         ))
)