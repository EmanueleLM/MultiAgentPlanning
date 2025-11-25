(define (problem blocks-world-instance)
  (:domain blocks-world-fast-downward)
  (:objects
    blue red orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - stage
  )

  (:init
    ;; Initial stacking configuration
    (on blue red)
    (on red orange)
    (on orange yellow)
    (ontable yellow)

    ;; Clear and hand state
    (clear blue)
    (handempty)

    ;; Distinctness for all ordered block pairs used by 'different' predicate
    (different blue red) (different blue orange) (different blue yellow)
    (different red blue) (different red orange) (different red yellow)
    (different orange blue) (different orange red) (different orange yellow)
    (different yellow blue) (different yellow red) (different yellow orange)

    ;; Stage ordering and start stage
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16)

    (current s0)
  )

  (:goal (and
    (on red orange)
    (on blue yellow)
    (on yellow red)
  ))
)