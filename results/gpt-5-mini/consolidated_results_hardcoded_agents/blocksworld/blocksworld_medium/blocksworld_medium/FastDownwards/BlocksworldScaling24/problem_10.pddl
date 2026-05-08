(define (problem stack-red-blue-orange-yellow)
  (:domain blocks-multiagent-final)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    (ontable red)
    (ontable orange)
    (ontable yellow)
    (on blue orange)

    (clear red)
    (clear blue)
    (clear yellow)

    (handempty)

    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (current s0)
  )

  (:goal (and
           (on red blue)
           (on blue orange)
           (on orange yellow)
         ))
)