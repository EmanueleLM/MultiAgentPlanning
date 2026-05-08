(define (problem stack-red-blue-orange-yellow)
  (:domain BlocksworldScaling13)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )
  (:init
    (on red orange)
    (on yellow blue)
    (ontable blue)
    (ontable orange)

    (clear red)
    (clear yellow)

    (handempty)

    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)

    (at-stage s0)
  )

  (:goal (and
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (ontable yellow)
    (at-stage s10)
  ))
)