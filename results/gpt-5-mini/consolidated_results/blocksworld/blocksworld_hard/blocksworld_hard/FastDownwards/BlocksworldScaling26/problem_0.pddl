(define (problem blocks-instance)
  (:domain blocks-sequenced)

  (:objects
    red blue yellow orange - block
    table - table
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 - phase
  )

  (:init
    ;; initial stacking (as given)
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (on orange table)

    ;; initial clear / hand state (as given)
    (clear red)
    (handempty)

    ;; initial phase for enforcing the provided ordered plan
    (at-phase p1)

    ;; phase ordering (enforce the concrete 12-step sequence)
    (next p1 p2)
    (next p2 p3)
    (next p3 p4)
    (next p4 p5)
    (next p5 p6)
    (next p6 p7)
    (next p7 p8)
    (next p8 p9)
    (next p9 p10)
    (next p10 p11)
    (next p11 p12)
    (next p12 p13)
  )

  (:goal (and
    ;; required terminal stacking configuration (explicit)
    (on red blue)
    (on orange red)
    (on yellow orange)

    ;; require that the enforced sequence has completed
    (at-phase p13)
  ))
)