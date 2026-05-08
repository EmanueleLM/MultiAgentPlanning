(define (problem blocksworld-scaling28-p01)
  (:domain blocksworld-scaling28)
  (:objects
    orange red yellow blue - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )
  (:init
    (ontable blue)
    (on yellow blue)
    (on red yellow)
    (on orange red)
    (clear orange)
    (handempty)

    (at-stage s0)
    (successor s0 s1)
    (successor s1 s2)
    (successor s2 s3)
    (successor s3 s4)
    (successor s4 s5)
    (successor s5 s6)
    (successor s6 s7)
    (successor s7 s8)
    (successor s8 s9)
    (successor s9 s10)
    (successor s10 s11)
    (successor s11 s12)
  )
  (:goal (and
    (on red orange)
    (on blue red)
    (on orange yellow)
  ))
)