(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects
    blue red yellow orange - block
  )
  (:init
    ;; Initial on relationships: blue on red, red on yellow, yellow on orange, orange on table
    (on blue red)
    (on red yellow)
    (on yellow orange)
    (on-table orange)

    ;; Clear and hand state
    (clear blue)
    (hand-empty)
  )
  (:goal (and
    ;; Goal: red on yellow, and orange on blue
    (on red yellow)
    (on orange blue)
  ))
)