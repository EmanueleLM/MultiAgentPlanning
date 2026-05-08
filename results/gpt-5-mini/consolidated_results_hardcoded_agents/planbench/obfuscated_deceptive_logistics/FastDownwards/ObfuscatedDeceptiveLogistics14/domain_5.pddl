(define (domain ObfuscatedDeceptiveLogistics14)
  (:requirements :typing :negative-preconditions :strips)
  (:types obj time)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (spring ?x - obj)

    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)

    (now ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  ;; Actions faithfully implement the specified preconditions and effects.
  ;; To enforce contiguous occupancy of "next" relations, any action that
  ;; establishes a new (next ?o ?y) requires an explicit existing (next ?o ?old)
  ;; and deletes that old relation. This prevents creating multiple concurrent
  ;; next targets for the same subject.

  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?old - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (next ?o0 ?old)
    )
    :effect (and
      (not (now ?t))
      (now ?tnext)
      (next ?o0 ?o2)
      (not (next ?o0 ?old))
      (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (now ?t))
      (now ?tnext)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (not (now ?t))
      (now ?tnext)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (now ?t))
      (now ?tnext)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (now ?t))
      (now ?tnext)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?old - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (next ?o0 ?old)
    )
    :effect (and
      (not (now ?t))
      (now ?tnext)
      (next ?o0 ?o2)
      (not (next ?o0 ?old))
      (not (vase ?o0 ?o1))
    )
  )
)