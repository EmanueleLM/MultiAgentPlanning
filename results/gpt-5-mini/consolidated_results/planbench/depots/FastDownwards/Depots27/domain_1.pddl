(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
  )

  ;; Player A actions (paltry, sip, clip, tightfisted) - encoded exactly per specification
  (:action pa-paltry
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

  (:action pa-sip
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

  (:action pa-clip
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

  (:action pa-tightfisted
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

  ;; Player B actions (wretched, memory) - encoded exactly per specification
  (:action pb-wretched
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

  (:action pb-memory
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
)