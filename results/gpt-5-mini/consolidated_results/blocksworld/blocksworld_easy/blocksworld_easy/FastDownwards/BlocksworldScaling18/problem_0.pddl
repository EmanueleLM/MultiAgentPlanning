(define (problem blocks-instance)
  (:domain blocks-world)
  (:objects a b c - block)
  (:init
    ;; Initial configuration:
    ;; a is on b; b and c are on the table; a and c are clear; agent's hand is empty.
    (on a b)
    (ontable b)
    (ontable c)
    (clear a)
    (clear c)
    (handempty)
    ;; Note: b is not clear because a is on b (so no (clear b) fact)
  )
  ;; Goal: make a stack a on b on c, with c on the table.
  (:goal (and
    (on a b)
    (on b c)
    (ontable c)
  ))
)