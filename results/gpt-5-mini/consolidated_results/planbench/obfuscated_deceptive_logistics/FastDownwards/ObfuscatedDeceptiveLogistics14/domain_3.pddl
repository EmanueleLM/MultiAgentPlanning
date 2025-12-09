(define (domain ObfuscatedDeceptiveLogistics14)
  (:requirements :typing :negative-preconditions :strips)
  (:types hand cat sneeze stupendous obj time)

  (:predicates
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)

    ;; time bookkeeping
    (now ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  (:action paltry
    :parameters (?o0 - hand ?o1 - cat ?o2 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (now ?t))
      (now ?tnext)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?o0 - hand ?o1 - cat ?o2 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
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
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
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
    :parameters (?o0 - sneeze ?o1 - obj ?o2 - obj ?o3 - stupendous ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (texture ?o1)
      (texture ?o2)
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
    :parameters (?o0 - cat ?o1 - obj ?o2 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
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
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - obj ?t - time ?tnext - time)
    :precondition (and
      (now ?t)
      (succ ?t ?tnext)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (not (now ?t))
      (now ?tnext)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)