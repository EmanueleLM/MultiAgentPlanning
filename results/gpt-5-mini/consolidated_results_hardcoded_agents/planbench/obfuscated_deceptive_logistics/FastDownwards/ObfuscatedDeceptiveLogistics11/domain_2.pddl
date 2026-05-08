(define (domain object-ordering-explicit-stages)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (next ?x - object ?y - object)
    (vase ?x - object ?y - object)
    (collect ?x - object ?y - object)

    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)

    ;; explicit discrete stage bookkeeping (strict contiguous progression)
    (next-stage ?s1 - stage ?s2 - stage)
    (used-stage ?s - stage)
    (free-stage ?s - stage)
  )

  (:action paltry
    :parameters (?prev ?t - stage ?o0 ?o1 ?o2 - object)
    :precondition (and
      (next-stage ?prev ?t)
      (used-stage ?prev)
      (free-stage ?t)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (free-stage ?t))
      (used-stage ?t)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?prev ?t - stage ?o0 ?o1 ?o2 - object)
    :precondition (and
      (next-stage ?prev ?t)
      (used-stage ?prev)
      (free-stage ?t)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (free-stage ?t))
      (used-stage ?t)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action clip
    :parameters (?prev ?t - stage ?o0 ?o1 ?o2 - object)
    :precondition (and
      (next-stage ?prev ?t)
      (used-stage ?prev)
      (free-stage ?t)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (not (free-stage ?t))
      (used-stage ?t)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action wretched
    :parameters (?prev ?t - stage ?o0 ?o1 ?o2 ?o3 - object)
    :precondition (and
      (next-stage ?prev ?t)
      (used-stage ?prev)
      (free-stage ?t)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (free-stage ?t))
      (used-stage ?t)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action memory
    :parameters (?prev ?t - stage ?o0 ?o1 ?o2 - object)
    :precondition (and
      (next-stage ?prev ?t)
      (used-stage ?prev)
      (free-stage ?t)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (free-stage ?t))
      (used-stage ?t)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action tightfisted
    :parameters (?prev ?t - stage ?o0 ?o1 ?o2 - object)
    :precondition (and
      (next-stage ?prev ?t)
      (used-stage ?prev)
      (free-stage ?t)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (not (free-stage ?t))
      (used-stage ?t)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

)