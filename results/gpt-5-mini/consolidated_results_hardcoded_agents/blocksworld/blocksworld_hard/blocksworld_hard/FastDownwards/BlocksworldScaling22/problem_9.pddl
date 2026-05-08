(define (problem BlocksworldScaling22-problem)
  (:domain blocksworld)
  (:objects
    red orange yellow blue - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )

  (:init
    (ontable blue)
    (on red blue)
    (on yellow red)
    (on orange yellow)
    (clear orange)
    (handempty)

    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)

    (current s0)
  )

  (:goal (and
    (on red orange)
    (on orange yellow)
    (on yellow blue)
  ))
)