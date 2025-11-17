(define (domain multiagent-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ; static unary/object properties
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?x - obj ?y - obj)
    (stupendous ?o - obj)

    ; mutable binary relations
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)

    ; stage bookkeeping
    (now ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - obj ?snee - obj ?t - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?y)
      (next ?h ?y)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (vase ?h ?snee)
      (not (next ?h ?y))
    )
  )

  (:action wretched
    :parameters (?snee - obj ?t1 - obj ?t2 - obj ?st - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (sneeze ?snee)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?snee ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (next ?snee ?t2)
      (not (next ?snee ?t1))
    )
  )

  (:action memory
    :parameters (?c - obj ?sp1 - obj ?sp2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (next ?c ?sp2)
      (not (next ?c ?sp1))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?t)
      (vase ?h ?snee)
    )
    :effect (and
      (not (now ?s))
      (now ?s2)

      (next ?h ?t)
      (not (vase ?h ?snee))
    )
  )
)