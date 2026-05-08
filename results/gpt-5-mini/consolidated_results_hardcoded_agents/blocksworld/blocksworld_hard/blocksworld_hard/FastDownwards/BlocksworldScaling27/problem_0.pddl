(define (problem blocks-world-instance)
  (:domain blocks-world-fast-downward)
  (:objects
    blue red orange yellow - block
  )

  (:init
    ; Type-style bookkeeping (explicit block fluents as requested)
    (block blue)
    (block red)
    (block orange)
    (block yellow)

    ; Stack initial configuration (explicit)
    (on blue red)
    (on red orange)
    (on orange yellow)
    (ontable yellow)

    ; Clear and hand state (explicit)
    (clear blue)
    (handempty)
  )

  (:goal (and
    (on red orange)
    (on blue yellow)
    (on yellow red)
  ))
)