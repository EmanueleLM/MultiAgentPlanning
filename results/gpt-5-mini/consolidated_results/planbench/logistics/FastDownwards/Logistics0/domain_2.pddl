(define (domain orchestrator-next-link)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (next ?from - obj ?to - obj)
    (cats ?o - obj)
    (hand ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (stupendous ?o - obj)
  )

  (:action paltry
    :parameters (?h - obj ?x - obj ?y - obj)
    :precondition (and
      (hand ?h)
      (cats ?x)
      (texture ?y)
      (vase ?h ?x)
      (next ?x ?y)
    )
    :effect (and
      (next ?h ?y)
      (not (vase ?h ?x))
    )
  )

  (:action sip
    :parameters (?h - obj ?x - obj ?y - obj)
    :precondition (and
      (hand ?h)
      (cats ?x)
      (texture ?y)
      (next ?h ?y)
      (next ?x ?y)
    )
    :effect (and
      (vase ?h ?x)
      (not (next ?h ?y))
    )
  )

  (:action clip
    :parameters (?h - obj ?snee - obj ?y - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?y)
      (next ?snee ?y)
      (next ?h ?y)
    )
    :effect (and
      (vase ?h ?snee)
      (not (next ?h ?y))
    )
  )

  (:action wretched
    :parameters (?snee - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?snee)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?snee ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?snee ?t2)
      (not (next ?snee ?t1))
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?t)
      (vase ?h ?snee)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?snee))
    )
  )
)