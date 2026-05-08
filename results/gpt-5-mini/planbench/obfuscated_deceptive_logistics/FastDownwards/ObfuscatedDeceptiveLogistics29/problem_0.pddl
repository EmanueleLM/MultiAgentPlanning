(define (problem link-problem)
  (:domain sequence-linking)

  (:objects
    player analyst auditor - agent
    object_6 object_7 object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; No next relations or successor flags initially.
    ;; Agents are declared as typed objects; no special init predicates required.
  )

  ;; The mandated terminal conditions: explicit next relations required by the specification.
  (:goal (and
           (next object_11 object_10)
           (next object_12 object_6)
           (next object_13 object_10)
           (next object_14 object_7)
         )
  )
)