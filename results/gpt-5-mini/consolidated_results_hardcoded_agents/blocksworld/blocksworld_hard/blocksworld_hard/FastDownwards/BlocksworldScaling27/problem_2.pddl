(define (problem blocks-world-instance)
  (:domain blocks-world-fast-downward)
  (:objects
    blue red orange yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - stage
  )

  (:init
    ; Stack initial configuration
    (on blue red)
    (on red orange)
    (on orange yellow)
    (ontable yellow)

    ; Clear and hand state (as provided)
    (clear blue)
    (handempty)

    ; Stage ordering and start stage (explicit discrete progression)
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