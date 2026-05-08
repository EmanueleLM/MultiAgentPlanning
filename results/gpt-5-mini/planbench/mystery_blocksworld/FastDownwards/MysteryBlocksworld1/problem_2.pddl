(define (problem mystery_blocksworld1_problem)
  (:domain mystery_blocksworld1)
  (:objects
    a b c d - object
  )

  (:init
    ;; initial craves network
    (craves b c)
    (craves c d)
    (craves d a)

    ;; global state
    (harmony)

    ;; initial planet and province assignments
    (planet a)
    (province b)
  )

  (:goal (and
           (craves a c)
           (craves d a)
         )
  )
)