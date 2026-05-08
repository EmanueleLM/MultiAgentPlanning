(define (problem mystery-instance)
  (:domain MysteryBlocksworld25)
  (:objects
    a b c d - object
  )

  (:init
    ;; Initial cravings
    (craves b d)
    (craves c a)

    ;; Global harmony present initially
    (harmony)

    ;; Initial planets and provinces
    (planet a)
    (planet d)
    (province b)
    (province c)
  )

  (:goal (and
    (craves a c)
    (craves d a)
  ))
)