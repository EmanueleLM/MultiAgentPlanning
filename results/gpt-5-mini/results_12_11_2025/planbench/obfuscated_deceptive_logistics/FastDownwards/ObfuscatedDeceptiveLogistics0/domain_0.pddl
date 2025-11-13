(define (domain orchestrator_domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 ?o2 - obj)
    (next ?o1 ?o2 - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o1 ?o2 - obj)
    (spring ?o - obj)
  )

  ;; Action: paltry
  ;; public spec:
  ;; requires hand ?o0, cats ?o1, texture ?o2, vase ?o0 ?o1, next ?o1 ?o2.
  ;; adds next ?o0 ?o2 and removes vase ?o0 ?o1.
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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
  ;; requires hand ?o0, cats ?o1, texture ?o2, next ?o0 ?o2, next ?o1 ?o2.
  ;; adds vase ?o0 ?o1 and removes next ?o0 ?o2.
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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
  ;; requires hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, next ?o0 ?o2.
  ;; adds vase ?o0 ?o1 and removes next ?o0 ?o2.
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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
  ;; requires sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3, next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3.
  ;; adds next ?o0 ?o2 and removes next ?o0 ?o1.
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
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
  ;; requires cats ?o0, spring ?o1, spring ?o2, next ?o0 ?o1.
  ;; adds next ?o0 ?o2 and removes next ?o0 ?o1.
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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
  ;; requires hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, vase ?o0 ?o1.
  ;; adds next ?o0 ?o2 and removes vase ?o0 ?o1.
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
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