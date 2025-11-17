(define (domain Logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    stage
  )

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (spring ?x - obj)

    (vase ?h - obj ?c - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)

    (succ ?p - stage ?s - stage)
    (used ?s - stage)
  )

  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?p - stage ?s - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (used ?s)
    )
  )

  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?p - stage ?s - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (used ?s)
    )
  )

  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?p - stage ?s - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (used ?s)
    )
  )

  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?p - stage ?s - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (used ?s)
    )
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?p - stage ?s - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (used ?s)
    )
  )

  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?p - stage ?s - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (used ?s)
    )
  )
)