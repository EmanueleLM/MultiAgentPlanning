(define (domain multiagent-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ; unary properties (merged where properties always co-occur in instances)
    (hand ?o - obj)
    (cats ?o - obj)
    (texspr ?o - obj)      ; merged "texture" and "spring" for objects that have both
    (sneeze ?o - obj)
    (stupendous ?o - obj)

    ; binary relations
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
  )

  ;; Actions follow the original precondition/effect structure but without
  ;; staging bookkeeping. Effects toggle the relevant binary relations.

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texspr ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texspr ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - obj ?snee - obj ?t - obj ?y - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texspr ?t)
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
      (texspr ?t1)
      (texspr ?t2)
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
    :parameters (?c - obj ?sp1 - obj ?sp2 - obj)
    :precondition (and
      (cats ?c)
      (texspr ?sp1)
      (texspr ?sp2)
      (next ?c ?sp1)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texspr ?t)
      (next ?snee ?t)
      (vase ?h ?snee)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?snee))
    )
  )
)