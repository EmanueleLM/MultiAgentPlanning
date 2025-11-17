(define (problem mapping-instance)
  (:domain multiagent-mapping)
  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  ; Initial state (corrected by the auditor): no adjacency relationships or successor/predecessor marks exist.
  ; All relevant predicates are therefore false by absence; we assert no positive next/has-* facts here.
  (:init
    ; no facts asserted: closed-world assumption applies and all (has-*) and (next ...) are false initially
  )

  ; Goals: union of required next relations from the use-case statements.
  ; Each required "next" relation must hold in the final state.
  (:goal
    (and
      (next object_11 object_7)
      (next object_12 object_8)
      (next object_12 object_10)
      (next object_13 object_9)
    )
  )
)