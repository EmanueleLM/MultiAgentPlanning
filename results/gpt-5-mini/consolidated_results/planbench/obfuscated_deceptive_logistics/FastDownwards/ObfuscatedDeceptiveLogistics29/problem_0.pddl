(define (problem link-problem)
  (:domain link-domain)
  (:objects
    object_6 object_7 object_10 object_11 object_12 object_13 object_14 - node
  )
  ; Initial state: no next relations exist and no source node has an outgoing next.
  ; (All such bookkeeping is explicit; there are no hidden tokens or penalty actions.)
  (:init
    ; No facts: absence of (next ...) and (has-next ...) is the initial condition.
    ; (An explicit empty init is represented by listing no positive predicates.)
  )
  ; Goal: require exactly the mandated terminal next-relations.
  ; These are hard constraints; the planner must produce actions that yield these facts.
  (:goal (and
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_7)
  ))
)