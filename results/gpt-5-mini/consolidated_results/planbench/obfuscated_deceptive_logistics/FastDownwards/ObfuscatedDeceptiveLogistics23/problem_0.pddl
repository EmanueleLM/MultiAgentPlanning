(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ;; Objects (o0..o13 reflect analyst object indices 0..13)
  (:objects
    o0 o1 o2 o3 o4 o5 o6 o7 o8 o9 o10 o11 o12 o13 - obj
  )

  ;; Initial facts (translated from analyst initial state)
  (:init
    ;; unary type-like predicates
    (cat o0)
    (cat o1)

    (stupendous o2)
    (stupendous o3)

    (sneeze o4)
    (sneeze o5)

    (spring o6)
    (spring o9)

    (hand o12)
    (hand o13)

    ;; textures (objects 6..11 are textures; object 9 explicitly mentioned)
    (texture o6)
    (texture o7)
    (texture o8)
    (texture o9)
    (texture o10)
    (texture o11)

    ;; collect relations (collect(texture, stupendous))
    (collect o10 o3)
    (collect o11 o3)
    (collect o9  o3)
    (collect o6  o2)
    (collect o7  o2)
    (collect o8  o2)

    ;; next links present initially
    (next o0 o9)   ;; cat o0 -> texture o9
    (next o1 o9)   ;; cat o1 -> texture o9

    (next o12 o11) ;; hand o12 -> texture o11
    (next o13 o7)  ;; hand o13 -> texture o7

    (next o4 o8)   ;; sneeze o4 -> texture o8
    (next o5 o11)  ;; sneeze o5 -> texture o11

    ;; NOTE: No vase(...) facts exist initially (explicitly none). Actions must create them.
  )

  ;; Goal: enforce the mandated terminal conditions exactly
  (:goal (and
    (next o12 o10)   ;; require hand o12 -> texture o10
    (next o13 o9)    ;; require hand o13 -> texture o9
  ))
)