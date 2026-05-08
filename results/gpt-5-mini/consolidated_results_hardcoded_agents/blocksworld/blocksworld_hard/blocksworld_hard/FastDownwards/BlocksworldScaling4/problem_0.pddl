(define (problem build-blue-on-orange-on-yellow)
  (:domain blocks-world)
  (:objects
    blue orange yellow - block
  )
  (:init
    ;; initial placement: all blocks on the table and clear, hand empty
    (on-table blue)
    (on-table orange)
    (on-table yellow)
    (clear blue)
    (clear orange)
    (clear yellow)
    (handempty)
  )
  (:goal (and
    (on blue orange)
    (on orange yellow)
  ))
)