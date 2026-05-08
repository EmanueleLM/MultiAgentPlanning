(define (problem blocks-world-instance)
  (:domain blocks-world-fast-downward)
  (:objects
    blue red orange yellow - block
  )

  (:init
    ; Stack initial configuration
    (on blue red)
    (on red orange)
    (on orange yellow)
    (ontable yellow)

    ; Clear and hand state
    (clear blue)
    (handempty)
  )

  (:goal (and
    (on red orange)
    (on blue yellow)
    (on yellow red)
  ))
)