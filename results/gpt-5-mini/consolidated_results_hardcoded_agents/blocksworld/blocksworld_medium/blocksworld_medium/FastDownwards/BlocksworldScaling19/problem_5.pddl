(define (problem blocks-problem)
  (:domain blocks)
  (:objects
    blue yellow orange red - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 - stage
  )

  (:init
    (on orange red)
    (on yellow orange)
    (ontable red)
    (ontable blue)
    (clear blue)
    (clear yellow)
    (handempty)

    (stage-active s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
  )

  (:goal (and
    (on blue orange)
    (on yellow red)
  ))