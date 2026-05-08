(define (problem mystery_blocksworld26-problem)
  (:domain mystery_blocksworld26)
  (:objects
    a b c d - object
  )

  (:init
    ;; Initial craves relations
    (craves a b)
    (craves b d)

    ;; Initial global condition
    (harmony)

    ;; Initial planets
    (planet c)
    (planet d)

    ;; Initial provinces
    (province a)
    (province c)

    ;; Explicit distinctness facts for all ordered pairs of distinct objects
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )

  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)