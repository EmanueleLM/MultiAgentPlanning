(define (problem mysteryblocksworld-problem)
  (:domain mysteryblocksworld)
  (:objects
    a b c d - entity
    ph1 ph2 ph3 ph4 ph5 ph6 ph7 ph8 ph9 ph10 ph11 ph12 - phase
  )
  (:init
    ;; initial craving relations
    (craves a b)
    (craves b c)
    (craves c d)

    ;; initial world state
    (harmony)
    (planet d)
    (province a)

    ;; phase adjacency: linear sequence ph1 -> ph2 -> ... -> ph12 ; final phase loops to itself
    (next ph1 ph2)
    (next ph2 ph3)
    (next ph3 ph4)
    (next ph4 ph5)
    (next ph5 ph6)
    (next ph6 ph7)
    (next ph7 ph8)
    (next ph8 ph9)
    (next ph9 ph10)
    (next ph10 ph11)
    (next ph11 ph12)
    (next ph12 ph12)

    ;; only the first phase is ready at start
    (phase-ready ph1)
  )
  (:goal (and
    (craves b c)
    (craves c d)
    (craves d a)
  ))
)