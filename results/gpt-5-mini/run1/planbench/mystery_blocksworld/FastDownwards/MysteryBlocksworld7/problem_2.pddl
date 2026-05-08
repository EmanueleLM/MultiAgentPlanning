(define (problem MysteryBlocksworld7)
  (:domain mystery-craving)
  ; Modeling notes:
  ; - This domain uses a single global fluent (harmony) and per-object fluents (province, planet, pain).
  ; - craves is a directed relation craves <from> <to>.
  ; - Actions and their preconditions/effects follow the human specification exactly.
  (:objects a b c d - obj)

  (:init
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province b)
    (province c)
  )

  (:goal (and
    (craves a c)
    (craves b a)
    (craves d b)
  ))
)