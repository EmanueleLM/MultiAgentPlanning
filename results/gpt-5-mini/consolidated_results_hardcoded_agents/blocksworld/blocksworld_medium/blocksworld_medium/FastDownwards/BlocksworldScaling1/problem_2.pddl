(define (problem blocks_instance)
  (:domain BlocksworldScaling1)

  (:objects
    orange yellow red blue - block
    table - surface
    s0 s1 s2 s3 s4 s5 s6 - stage
    ; place type is implicit via block/surface subtypes
  )

  (:init
    ;; initial placement
    (on orange blue)
    (on yellow red)
    (on red table)
    (on blue table)

    ;; initial clearness
    (clear orange)
    (clear yellow)

    ;; single shared hand is empty
    (handempty)

    ;; explicit stage/time progression: start at s0, actions advance along succ chain
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)

    ;; mark the table surface
    (is-table table)
  )

  ;; Terminal conditions: require goal configuration at final stage s6.
  (:goal (and
    (on red blue)
    (at-stage s6)
  ))
)