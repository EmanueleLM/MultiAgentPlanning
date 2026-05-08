(define (problem blocks-problem-ordered)
  (:domain blocks-world-ordered)
  (:objects
    red orange blue yellow - block
    p1 p2 p3 p4 p5 p6 p7 - phase
  )
  (:init
    ;; initial stacking: orange on blue on yellow; red on table
    (on blue yellow)
    (on orange blue)
    (ontable red)
    (ontable yellow)

    ;; clear blocks (top-of-stack blocks and table-held single blocks)
    (clear red)
    (clear orange)

    ;; hand initially empty
    (handempty)

    ;; explicit phase ordering and initial current phase
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
    ;; terminal condition: plan must reach phase p7 (exactly 6 phase-consuming actions)
    (current p7)
  ))
)