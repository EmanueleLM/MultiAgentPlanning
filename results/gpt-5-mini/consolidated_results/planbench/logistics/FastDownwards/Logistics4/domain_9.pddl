(define (domain orchestrated-collection)
  (:requirements :strips :negative-preconditions)

  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o1 ?o2)
    (next ?o1 ?o2)
    (sneeze ?o)
    (stupendous ?o)
    (collect ?o1 ?o2)
    (spring ?o)
    ;; explicit discrete stage/time modeling
    (stage ?t)
    (succ ?t1 ?t2)
    (now ?t)
  )

  ;; Actions require an explicit current stage ?t and advance to successor ?t2.
  ;; This enforces discrete, contiguous progression of stages and prevents
  ;; replay/oscillation at the same stage.

  (:action paltry
    :parameters (?o0 ?o1 ?o2 ?t ?t2)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (now ?t)
      (succ ?t ?t2)
      (stage ?t)
      (stage ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (now ?t2)
      (not (now ?t))
    )
  )

  (:action sip
    :parameters (?o0 ?o1 ?o2 ?t ?t2)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (now ?t)
      (succ ?t ?t2)
      (stage ?t)
      (stage ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (now ?t2)
      (not (now ?t))
    )
  )

  (:action clip
    :parameters (?o0 ?o1 ?o2 ?t ?t2)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (now ?t)
      (succ ?t ?t2)
      (stage ?t)
      (stage ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (now ?t2)
      (not (now ?t))
    )
  )

  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3 ?t ?t2)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (now ?t)
      (succ ?t ?t2)
      (stage ?t)
      (stage ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (now ?t2)
      (not (now ?t))
    )
  )

  (:action memory
    :parameters (?o0 ?o1 ?o2 ?t ?t2)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (now ?t)
      (succ ?t ?t2)
      (stage ?t)
      (stage ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (now ?t2)
      (not (now ?t))
    )
  )

  (:action tightfisted
    :parameters (?o0 ?o1 ?o2 ?t ?t2)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (now ?t)
      (succ ?t ?t2)
      (stage ?t)
      (stage ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (now ?t2)
      (not (now ?t))
    )
  )
)