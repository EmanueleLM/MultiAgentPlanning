(define (problem BlocksworldScaling21-problem)
  (:domain blocksworld-temporal)

  (:objects
    blue orange red yellow - block
    s1 s2 s3 s4 s5 s6 s7 s8 s9 - slot
  )

  (:init
    ;; initial world configuration (from the human specification)
    (on blue yellow)
    (on orange red)
    (on-table red)
    (on-table yellow)

    (clear blue)
    (clear orange)

    (handempty)

    ;; timeline initialization: start at s1
    (current s1)

    ;; strict successor chain (enforces contiguous slot progression)
    (slot-next s1 s2)
    (slot-next s2 s3)
    (slot-next s3 s4)
    (slot-next s4 s5)
    (slot-next s5 s6)
    (slot-next s6 s7)
    (slot-next s7 s8)
    (slot-next s8 s9)
  )

  (:goal (and
    (on red orange)
    (on yellow red)
  ))
)