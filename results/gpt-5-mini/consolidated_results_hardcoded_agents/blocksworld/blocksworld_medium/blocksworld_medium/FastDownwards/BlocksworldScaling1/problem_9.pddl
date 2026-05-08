(define (problem blocks_instance)
  (:domain BlocksworldScaling1)

  (:objects
    orange yellow red blue - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )

  (:init
    ;; initial placements
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)

    ;; clear status for topmost blocks
    (clear orange)
    (clear yellow)

    ;; hand initially empty
    (handempty)

    ;; contiguous stage/time progression: start at s0 and successor chain through s6
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
  )

  ;; Terminal condition requires goal configuration at the final stage s6.
  (:goal (and
    (on red blue)
    (at-stage s6)
  ))
)