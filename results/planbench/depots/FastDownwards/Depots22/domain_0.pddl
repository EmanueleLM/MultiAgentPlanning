; Assumptions and notes:
; - The action schemas below are a direct encoding of the provided informal schemas.
; - The two STATEMENT blocks (initial facts / plan variants) were not included in the inputs I received,
;   so I did NOT invent any initial fluent facts. The problem file below is left with a minimal initial
;   state (no fluent atoms). If you have the STATEMENT initial facts, add them into the problem (:init ...) section.
; - All preferences and "busy/blocked" intervals referenced by the agents were not given concretely;
;   treat them as hard constraints by placing the corresponding facts into the problem initial state when available.
; - This domain uses only classical STRIPS constructs with negative effects and no conditional effects,
;   compatible with Fast Downward. No :fluents or durative actions are used.
(define (domain object-play)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o ?o2)
    (next ?o ?o2)
    (collect ?o ?o2)
    (sneeze ?o)
    (spring ?o)
    (stupendous ?o)
  )

  ;; paltry(object_0,object_1,object_2)
  ;; requires: hand ?o0, cats ?o1, texture ?o2, vase ?o0 ?o1, next ?o1 ?o2
  ;; effects: adds next ?o0 ?o2, removes vase ?o0 ?o1
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

  ;; sip(object_0,object_1,object_2)
  ;; requires: hand ?o0, cats ?o1, texture ?o2, next ?o0 ?o2, next ?o1 ?o2
  ;; effects: adds vase ?o0 ?o1, removes next ?o0 ?o2
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

  ;; clip(object_0,object_1,object_2)
  ;; requires: hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, next ?o0 ?o2
  ;; effects: adds vase ?o0 ?o1, removes next ?o0 ?o2
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

  ;; wretched(object_0,object_1,object_2,object_3)
  ;; requires: sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3,
  ;;           next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ;; effects: adds next ?o0 ?o2, removes next ?o0 ?o1
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

  ;; memory(object_0,object_1,object_2)
  ;; requires: cats ?o0, spring ?o1, spring ?o2, next ?o0 ?o1
  ;; effects: adds next ?o0 ?o2, removes next ?o0 ?o1
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

  ;; tightfisted(object_0,object_1,object_2)
  ;; requires: hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, vase ?o0 ?o1
  ;; effects: adds next ?o0 ?o2, removes vase ?o0 ?o1
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
)