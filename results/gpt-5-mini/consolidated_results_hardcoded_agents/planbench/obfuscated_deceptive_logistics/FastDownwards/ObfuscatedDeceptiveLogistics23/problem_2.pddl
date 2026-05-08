(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ;; Objects actually used
  (:objects
    o0 o1 o2 o3 o4 o5 o6 o7 o8 o9 o10 o11 o12 o13 - obj
  )

  ;; Initial facts (trimmed: removed stage bookkeeping; kept only facts needed to preserve reachability)
  (:init
    ;; unary predicates
    (cats o0)
    (cats o1)

    (stupendous o2)
    (stupendous o3)

    (sneeze o4)
    (sneeze o5)

    (spring o6)
    (spring o9)

    (hand o12)
    (hand o13)

    (texture o6)
    (texture o7)
    (texture o8)
    (texture o9)
    (texture o10)
    (texture o11)

    ;; collect relations (as in the original specification)
    (collect o10 o3)
    (collect o11 o3)
    (collect o9  o3)
    (collect o6  o2)
    (collect o7  o2)
    (collect o8  o2)

    ;; next relations (kept those provided originally)
    (next o0 o9)
    (next o1 o9)

    (next o12 o11)
    (next o13 o7)

    (next o4 o8)
    (next o5 o11)
  )

  ;; Goal
  (:goal (and
    (next o12 o10)
    (next o13 o9)
  ))
)