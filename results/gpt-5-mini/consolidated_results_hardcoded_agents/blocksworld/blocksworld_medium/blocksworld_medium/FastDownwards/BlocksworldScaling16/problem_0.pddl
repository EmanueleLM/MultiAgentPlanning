(define (problem blocks-goal)
  (:domain blocks-world)
  (:objects red blue yellow orange - block)
  (:init
    ;; initial stack: red on yellow on orange (orange is on the table), blue on table
    (on red yellow)
    (on yellow orange)
    (on-table orange)
    (on-table blue)

    ;; clear blocks (only those explicitly given)
    (clear red)
    (clear blue)

    ;; hand is empty initially
    (hand-empty)
  )
  (:goal
    (and
      (on blue orange)
      (on orange yellow)
    )
  )
)