(define (problem mysteryblocksworld-problem)
  (:domain mysteryblocksworld)
  (:objects
    a b c d - entity
    ph1 ph2 ph3 ph4 ph5 ph6 ph7 ph8 ph9 ph10 ph11 ph12 ph13 - phase
  )
  (:init
    ; initial craving relations
    (craves a b)
    (craves b c)
    (craves c d)

    ; initial world facts
    (harmony)
    (planet d)
    (province a)

    ; initial current phase
    (current ph1)

    ; linear phase ordering (strict forward progression)
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
    (next ph12 ph13)
  )
  (:goal (and
    (craves b c)
    (craves c d)
    (craves d a)
  ))
)