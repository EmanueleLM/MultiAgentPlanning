(define (domain ObfuscatedDeceptiveLogistics23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)

    ;; object relation indexed by explicit stage/time
    (obj_next ?x - obj ?y - obj ?t - time)
    (vase ?x - obj ?y - obj ?t - time)

    ;; explicit discrete-time ordering
    (succ ?t1 - time ?t2 - time)
  )

  (:action paltry
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1 ?t)
      (obj_next ?o1 ?o2 ?t)
    )
    :effect (and
      (obj_next ?o0 ?o2 ?t2)
      (not (vase ?o0 ?o1 ?t2))
    )
  )

  (:action sip
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (obj_next ?o0 ?o2 ?t)
      (obj_next ?o1 ?o2 ?t)
    )
    :effect (and
      (vase ?o0 ?o1 ?t2)
      (not (obj_next ?o0 ?o2 ?t2))
    )
  )

  (:action clip
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (obj_next ?o1 ?o2 ?t)
      (obj_next ?o0 ?o2 ?t)
    )
    :effect (and
      (vase ?o0 ?o1 ?t2)
      (not (obj_next ?o0 ?o2 ?t2))
    )
  )

  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3 - obj ?t ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (obj_next ?o0 ?o1 ?t)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (obj_next ?o0 ?o2 ?t2)
      (not (obj_next ?o0 ?o1 ?t2))
    )
  )

  (:action memory
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (obj_next ?o0 ?o1 ?t)
    )
    :effect (and
      (obj_next ?o0 ?o2 ?t2)
      (not (obj_next ?o0 ?o1 ?t2))
    )
  )

  (:action tightfisted
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - time)
    :precondition (and
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (obj_next ?o1 ?o2 ?t)
      (vase ?o0 ?o1 ?t)
    )
    :effect (and
      (obj_next ?o0 ?o2 ?t2)
      (not (vase ?o0 ?o1 ?t2))
    )
  )
)