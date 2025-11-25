(define (problem bw-problem-1)
  (:domain blocks-world)
  (:objects a b c - block)
  (:init
    ;; Initial positions: all blocks are on the table and clear; single hand is empty.
    (ontable a)
    (ontable b)
    (ontable c)
    (clear a)
    (clear b)
    (clear c)
    (handempty)
  )
  ;; Goal: form a stack A on B, B on C, with C on the table.
  (:goal (and
    (on a b)
    (on b c)
    (ontable c)
  ))
)