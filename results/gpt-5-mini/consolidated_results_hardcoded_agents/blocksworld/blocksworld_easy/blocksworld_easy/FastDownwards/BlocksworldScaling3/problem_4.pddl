(define (problem blocksworld-ordered-prob)
  (:domain blocksworld-ordered)

  (:objects
    blue red orange yellow - block
    p0 p1 p2 - phase
  )

  (:init
    ;; block configuration:
    (on blue red)
    (on red orange)
    (ontable orange)
    (ontable yellow)

    ;; clearness: blocks with no block on top and not held
    (clear blue)
    (clear yellow)

    ;; hand is initially empty
    (handempty)

    ;; phase ordering and initial current phase
    (current p0)
    (next p0 p1)
    (next p1 p2)
  )

  (:goal (and
    (on red orange)
    (on yellow blue)
    ;; require reaching the final stage explicitly
    (current p2)
  ))
)