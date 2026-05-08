(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects
    blue red yellow orange - block
  )
  (:init
    ;; Tower: blue on red, red on yellow, yellow on orange, orange on table
    (on blue red)
    (on red yellow)
    (on yellow orange)
    (on-table orange)

    ;; Topmost clear block and hand state
    (clear blue)
    (hand-empty)
  )
  (:goal (and
    (on red yellow)
    (on orange blue)
  ))
)