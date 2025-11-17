(define (domain Logistics1)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (cats ?x - obj)
    (hand ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
  )

  (:action paltry
    :parameters (?h - obj ?c - obj ?tex - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tex)
      (vase ?h ?c)
      (next ?c ?tex)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?tex - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?tex)
      (next ?h ?tex)
      (next ?c ?tex)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?tex))
    )
  )

  (:action clip
    :parameters (?h - obj ?snee - obj ?tex - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?tex)
      (next ?snee ?tex)
      (next ?h ?tex)
    )
    :effect (and
      (vase ?h ?snee)
      (not (next ?h ?tex))
    )
  )

  (:action wretched
    :parameters (?snee - obj ?tex1 - obj ?tex2 - obj ?st - obj)
    :precondition (and
      (sneeze ?snee)
      (texture ?tex1)
      (texture ?tex2)
      (stupendous ?st)
      (next ?snee ?tex1)
      (collect ?tex1 ?st)
      (collect ?tex2 ?st)
    )
    :effect (and
      (next ?snee ?tex2)
      (not (next ?snee ?tex1))
    )
  )

  (:action memory
    :parameters (?c - obj ?sfrom - obj ?sto - obj)
    :precondition (and
      (cats ?c)
      (spring ?sfrom)
      (spring ?sto)
      (next ?c ?sfrom)
    )
    :effect (and
      (next ?c ?sto)
      (not (next ?c ?sfrom))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?tex - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?tex)
      (next ?snee ?tex)
      (vase ?h ?snee)
    )
    :effect (and
      (next ?h ?tex)
      (not (vase ?h ?snee))
    )
  )
)