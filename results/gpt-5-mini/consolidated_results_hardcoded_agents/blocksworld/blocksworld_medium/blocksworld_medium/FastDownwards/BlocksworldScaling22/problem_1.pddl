(define (problem orchestrated_blocks_problem)
  (:domain orchestrated_blocks)

  (:objects
    worker - agent
    blue orange yellow red - block
  )

  (:init
    ;; initial stacking: blue on yellow, yellow on red, red on the table, orange on the table
    (on blue yellow)
    (on yellow red)
    (ontable red)
    (ontable orange)

    ;; specified clear blocks
    (clear blue)
    (clear orange)

    ;; the single hand is empty initially
    (handempty worker)
  )

  (:goal
    (and
      (on blue red)
      (on orange yellow)
    )
  )
)