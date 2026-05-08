(define (problem blocksworld-scaling7)
  (:domain multi-agent-blocks)
  (:objects
    blue orange yellow red - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (current s0)

    (handempty)

    (on blue red)
    (ontable red)
    (ontable orange)
    (ontable yellow)

    (clear blue)
    (clear orange)
    (clear yellow)
  )

  (:goal (and
    (on red blue)
    (on blue orange)
    (on yellow red)
  ))
)