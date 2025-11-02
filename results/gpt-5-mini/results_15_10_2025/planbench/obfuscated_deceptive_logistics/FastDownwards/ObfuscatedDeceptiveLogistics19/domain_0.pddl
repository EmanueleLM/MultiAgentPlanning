(define (domain multiagent-orchestrator)
  (:requirements :strips :negative-preconditions)
  ;; Predicates observed in the scenario
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o1 ?o2)
    (next ?o1 ?o2)
    (sneeze ?o)
    (collect ?o1 ?o2)
    (spring ?o)
    (stupendous ?o)
  )

  ;; Action: paltry
  ; Parameters: object_0 object_1 object_2
  ; Preconditions: hand object_0, cats object_1, texture object_2, vase object_0 object_1, next object_1 object_2
  ; Add: next object_0 object_2
  ; Delete: vase object_0 object_1
  (:action paltry
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; Action: sip
  ; Parameters: object_0 object_1 object_2
  ; Preconditions: hand object_0, cats object_1, texture object_2, next object_0 object_2, next object_1 object_2
  ; Add: vase object_0 object_1
  ; Delete: next object_0 object_2
  (:action sip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; Action: clip
  ; Parameters: object_0 object_1 object_2
  ; Preconditions: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, next object_0 object_2
  ; Add: vase object_0 object_1
  ; Delete: next object_0 object_2
  (:action clip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; Action: wretched
  ; Parameters: object_0 object_1 object_2 object_3
  ; Preconditions: sneeze object_0, texture object_1, texture object_2, stupendous object_3,
  ;                next object_0 object_1, collect object_1 object_3, collect object_2 object_3
  ; Add: next object_0 object_2
  ; Delete: next object_0 object_1
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; Action: memory
  ; Parameters: object_0 object_1 object_2
  ; Preconditions: cats object_0, spring object_1, spring object_2, next object_0 object_1
  ; Add: next object_0 object_2
  ; Delete: next object_0 object_1
  (:action memory
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; Action: tightfisted
  ; Parameters: object_0 object_1 object_2
  ; Preconditions: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, vase object_0 object_1
  ; Add: next object_0 object_2
  ; Delete: vase object_0 object_1
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ; Note: All actions, predicates, and object identifiers are kept exactly as provided.
  ; If a precondition appeared underspecified in the narrative it would be marked in comments,
  ; but the supplied schemas were explicit and are encoded conservatively above.
)