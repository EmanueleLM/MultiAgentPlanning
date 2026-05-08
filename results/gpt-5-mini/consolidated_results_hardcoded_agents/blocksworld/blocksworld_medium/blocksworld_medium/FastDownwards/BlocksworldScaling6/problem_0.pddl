(define (problem bw-move-b-to-c)
  (:domain blocks-world)
  (:objects a b c - block)

  ;; Initial state:
  ;; - Block a is on the table.
  ;; - Block b is on block a.
  ;; - Block c is on the table.
  ;; - Blocks b and c are clear (nothing on top).
  ;; - Robot's hand is empty.
  (:init
    (ontable a)
    (on b a)
    (ontable c)
    (clear b)
    (clear c)
    (handempty)
  )

  ;; Goal conditions (all must hold):
  ;; - Block b must be on block c.
  ;; - Blocks a and c must be on the table.
  ;; - Robot's hand must be empty at termination.
  (:goal
    (and
      (on b c)
      (ontable a)
      (ontable c)
      (handempty)
    )
  )
)