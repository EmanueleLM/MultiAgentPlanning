(define (problem blocks_instance)
  (:domain BlocksworldScaling1)

  (:objects
    orange yellow red blue - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    ;; placements
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)

    ;; top blocks are clear
    (clear orange)
    (clear yellow)

    ;; hand initially empty
    (handempty)

    ;; contiguous stage/time progression: start at s0 and provide successor chain to s6
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )

  ;; Terminal condition requires the goal configuration at the final stage.
  (:goal (and
    (on red blue)
    (at-stage s6)
  ))
)