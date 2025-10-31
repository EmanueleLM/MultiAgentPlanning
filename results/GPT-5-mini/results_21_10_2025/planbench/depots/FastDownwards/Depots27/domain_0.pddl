(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj)
    (spring ?x - obj)
  )

  ; Player A actions (namespaced with pa-)
  (:action pa-paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (next ?o0 ?o1))
      (next ?o1 ?o2)
      (not (vase ?o1))
      (vase ?o2)
    )
  )

  (:action pa-sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (texture ?o1)
      (cats ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (next ?o1 ?o2))
      (next ?o0 ?o1)
      (not (vase ?o2))
      (vase ?o1)
    )
  )

  (:action pa-clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (texture ?o1)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (next ?o0 ?o1))
      (next ?o1 ?o2)
      (not (vase ?o0))
      (vase ?o2)
    )
  )

  (:action pa-tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (next ?o1 ?o2))
      (next ?o0 ?o2)
      (not (vase ?o1))
      (vase ?o0)
    )
  )

  ; Player B actions (namespaced with pb-)
  (:action pb-wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (stupendous ?o2)
      (collect ?o3)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (next ?o1 ?o2))
      (next ?o2 ?o3)
    )
  )

  (:action pb-memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (next ?o1 ?o2))
      (next ?o0 ?o2)
    )
  )

)