(define (problem MysteryBlocksworld7)
  (:domain mystery-craving)
  ; Modeling notes:
  ; - harmony is modeled as a single global fluent (0-arity predicate).
  ; - province, planet, and pain are per-object predicates.
  ; - craves is a directed relation craves <from> <to>.
  ; - The action schemas follow the human specification exactly; negative preconditions are used.
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