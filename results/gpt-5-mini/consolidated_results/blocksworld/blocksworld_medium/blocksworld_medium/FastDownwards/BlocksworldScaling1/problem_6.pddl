(define (problem blocks_instance)
  (:domain BlocksworldScaling1)

  (:objects
    orange yellow red blue - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    ;; placement
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)

    ;; clearness of top blocks
    (clear orange)
    (clear yellow)

    ;; hand initially empty
    (handempty)

    ;; stage/time progression: start at s0 and provide a contiguous successor chain to s6
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )

  ;; Terminal condition: require goal configuration at final stage s6.
  (:goal (and
    (on red blue)
    (at-stage s6)
  ))
)