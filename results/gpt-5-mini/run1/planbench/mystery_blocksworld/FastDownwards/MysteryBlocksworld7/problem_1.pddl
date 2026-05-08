(define (problem MysteryBlocksworld7)
  (:domain mystery-craving)
  ; Modeling notes:
  ; - Predicates:
  ;     (province ?x) and (planet ?x) are properties of objects.
  ;     (harmony) is a single global fluent.
  ;     (pain ?x) marks an object in pain.
  ;     (craves ?from ?to) is a binary relation between objects.
  ; - Action semantics follow the human specification exactly.
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