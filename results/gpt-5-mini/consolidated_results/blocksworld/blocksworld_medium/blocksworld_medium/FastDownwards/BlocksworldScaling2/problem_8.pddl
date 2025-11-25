(define (problem blocks-problem-ordered)
  (:domain blocks-world-ordered)
  (:objects
    red orange blue yellow - block
    p1 p2 p3 p4 p5 p6 p7 - phase
  )
  (:init
    ;; initial stacking: orange on blue, blue on yellow; red and yellow on the table as specified
    (on blue yellow)
    (on orange blue)
    (ontable red)
    (ontable yellow)

    ;; clear blocks: red and orange are initially clear (orange is top of stack)
    (clear red)
    (clear orange)

    ;; single hand available
    (handempty)

    ;; phase ordering: actions must advance along the provided chain
    (current p1)
    (next p1 p2)
    (next p2 p3)
    (next p3 p4)
    (next p4 p5)
    (next p5 p6)
    (next p6 p7)
  )
  (:goal (and
    (on red orange)
    (on blue red)
    ;; require that the final phase has been reached (enforces using the phase transitions)
    (current p7)
  ))
)