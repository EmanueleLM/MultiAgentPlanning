(define (problem blocks-problem)
  (:domain blocks)
  (:objects
    a b c - block
  )

  (:init
    ;; Initial arrangement:
    ;; a is on b, b and c are on the table, a and c are clear, the hand is empty.
    (on a b)
    (ontable b)
    (ontable c)
    (clear a)
    (clear c)
    (handempty)
  )

  (:goal (and
    ;; Mandated terminal conditions:
    ;; a must be on c, b must be on the table, and the hand must be empty.
    (on a c)
    (ontable b)
    (handempty)
  ))
)