(define (problem bw-prob-a)
  (:domain blocksworld)
  ;; Objects reconciled for problem A: a, b, c (all of type block)
  (:objects a b c - block)
  (:init
    ;; Initial stacking: a on b, b on table, c on table
    (on a b)
    (ontable b)
    (ontable c)
    ;; Clear blocks: a and c are clear (nothing on them)
    (clear a)
    (clear c)
    ;; Robot has empty hand initially
    (handempty)
  )
  ;; Goal: place block a on top of c, and ensure b remains on the table
  (:goal (and
    (on a c)
    (ontable b)
  ))
)