(define (problem bw-problem)
  (:domain blocksworld)
  (:objects
    orange blue yellow red - block
  )
  (:init
    ;; Initial arrangement: all blocks start on the table, all clear, and hand empty.
    (on-table orange)
    (on-table blue)
    (on-table yellow)
    (on-table red)

    (clear orange)
    (clear blue)
    (clear yellow)
    (clear red)

    (handempty)
  )
  (:goal (and
    (on orange blue)
    (on yellow red)
  ))
)