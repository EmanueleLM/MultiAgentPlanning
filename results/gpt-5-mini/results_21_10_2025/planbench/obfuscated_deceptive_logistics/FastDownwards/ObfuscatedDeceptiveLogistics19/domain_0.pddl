(define (domain orchestrator-domain)
  ; Orchestrator domain integrating agent action models.
  ; Predicates and action schemas are taken directly from agent descriptions.
  ; Comments: All parameters are typed as obj. No negative preconditions were specified;
  ; delete effects are modeled using standard STRIPS (not ...).
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (collect ?x ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ; Action: paltry
  ; parameters: object_0 object_1 object_2
  ; preconditions:
  ;   - hand object_0
  ;   - cats object_1
  ;   - texture object_2
  ;   - vase object_0 object_1
  ;   - next object_1 object_2
  ; add effects:
  ;   - next object_0 object_2
  ; delete effects:
  ;   - vase object_0 object_1
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (not (vase ?h ?c))
      (next ?h ?t)
    )
  )

  ; Action: sip
  ; parameters: object_0 object_1 object_2
  ; preconditions:
  ;   - hand object_0
  ;   - cats object_1
  ;   - texture object_2
  ;   - next object_0 object_2
  ;   - next object_1 object_2
  ; add effects:
  ;   - vase object_0 object_1
  ; delete effects:
  ;   - next object_0 object_2
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ; Action: clip
  ; parameters: object_0 object_1 object_2
  ; preconditions:
  ;   - hand object_0
  ;   - sneeze object_1
  ;   - texture object_2
  ;   - next object_1 object_2
  ;   - next object_0 object_2
  ; add effects:
  ;   - vase object_0 object_1
  ; delete effects:
  ;   - next object_0 object_2
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ; Action: wretched
  ; parameters: object_0 object_1 object_2 object_3
  ; preconditions:
  ;   - sneeze object_0
  ;   - texture object_1
  ;   - texture object_2
  ;   - stupendous object_3
  ;   - next object_0 object_1
  ;   - collect object_1 object_3
  ;   - collect object_2 object_3
  ; add effects:
  ;   - next object_0 object_2
  ; delete effects:
  ;   - next object_0 object_1
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (not (next ?s ?t1))
      (next ?s ?t2)
    )
  )

  ; Action: memory
  ; parameters: object_0 object_1 object_2
  ; preconditions:
  ;   - cats object_0
  ;   - spring object_1
  ;   - spring object_2
  ;   - next object_0 object_1
  ; add effects:
  ;   - next object_0 object_2
  ; delete effects:
  ;   - next object_0 object_1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (not (next ?c ?s1))
      (next ?c ?s2)
    )
  )

  ; Action: tightfisted
  ; parameters: object_0 object_1 object_2
  ; preconditions:
  ;   - hand object_0
  ;   - sneeze object_1
  ;   - texture object_2
  ;   - next object_1 object_2
  ;   - vase object_0 object_1
  ; add effects:
  ;   - next object_0 object_2
  ; delete effects:
  ;   - vase object_0 object_1
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (not (vase ?h ?s))
      (next ?h ?t)
    )
  )

)