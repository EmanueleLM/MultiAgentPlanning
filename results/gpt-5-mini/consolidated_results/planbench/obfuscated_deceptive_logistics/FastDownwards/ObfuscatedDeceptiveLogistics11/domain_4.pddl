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

    (next-stage ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  (:action paltry
    :parameters (?prev - stage ?t - stage ?o0 - object ?o1 - object ?o2 - object)
    :precondition (and
      (current-stage ?prev)
      (next-stage ?prev ?t)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (current-stage ?prev))
      (current-stage ?t)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action sip
    :parameters (?prev - stage ?t - stage ?o0 - object ?o1 - object ?o2 - object)
    :precondition (and
      (current-stage ?prev)
      (next-stage ?prev ?t)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (current-stage ?prev))
      (current-stage ?t)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action clip
    :parameters (?prev - stage ?t - stage ?o0 - object ?o1 - object ?o2 - object)
    :precondition (and
      (current-stage ?prev)
      (next-stage ?prev ?t)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (not (current-stage ?prev))
      (current-stage ?t)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  (:action wretched
    :parameters (?prev - stage ?t - stage ?o0 - object ?o1 - object ?o2 - object ?o3 - object)
    :precondition (and
      (current-stage ?prev)
      (next-stage ?prev ?t)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (current-stage ?prev))
      (current-stage ?t)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action memory
    :parameters (?prev - stage ?t - stage ?o0 - object ?o1 - object ?o2 - object)
    :precondition (and
      (current-stage ?prev)
      (next-stage ?prev ?t)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (current-stage ?prev))
      (current-stage ?t)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action tightfisted
    :parameters (?prev - stage ?t - stage ?o0 - object ?o1 - object ?o2 - object)
    :precondition (and
      (current-stage ?prev)
      (next-stage ?prev ?t)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (not (current-stage ?prev))
      (current-stage ?t)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)