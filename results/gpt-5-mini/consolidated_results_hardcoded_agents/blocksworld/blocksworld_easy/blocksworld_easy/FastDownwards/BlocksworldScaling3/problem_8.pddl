(define (problem blocksworld-ordered-prob)
  (:domain blocksworld-ordered)

  (:objects
    blue red orange yellow - block
    p0 p1 p2 - phase
  )

  (:init
    ;; structural relations: direct on relations and table facts
    (on blue red)
    (on red orange)
    (ontable orange)
    (ontable yellow)

    ;; clearness: blocks that have nothing on top and are not held
    (clear blue)
    (clear yellow)

    ;; hand is initially empty
    (handempty)

    ;; phase ordering and initial current phase
    (current p0)
    (next p0 p1)
    (next p1 p2)
  )

  ;; Goal: red on orange and yellow on blue, and final phase reached exactly.
  (:goal (and
    (on red orange)
    (on yellow blue)
    (current p2)
  ))
)