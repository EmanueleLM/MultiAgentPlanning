(define (problem blocks-problem)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )
  (:init
    ;; initial stacking: red on blue, blue on orange, orange on yellow, yellow on table
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (ontable yellow)

    ;; only red is clear initially (nothing on top) and hand is empty
    (clear red)
    (handempty)

    ;; initial stage
    (curr-stage s0)

    ;; contiguous stage successor relation (enforces one action per stage and contiguous progression)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
  )
  (:goal (and
    ;; desired final stacking
    (on blue orange)
    (on orange yellow)
    (on yellow red)

    ;; require that planning reached the designated terminal stage exactly
    (curr-stage s12)
  ))
)