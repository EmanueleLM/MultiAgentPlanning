(define (domain obfuscated-deceptive-logistics11)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj hand cats sneeze stupendous)

  (:predicates
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - stupendous)
    (spring ?x - obj)
  )

  ;; Actions rely on typing for unary role predicates (hand, cats, sneeze, stupendous)
  ;; so those do not need to appear as init facts.

  (:action paltry
    :parameters (?h - hand ?c - cats ?t - obj)
    :precondition (and
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - hand ?c - cats ?t - obj)
    :precondition (and
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - hand ?sn - sneeze ?t - obj)
    :precondition (and
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?sn - sneeze ?t1 - obj ?t2 - obj ?stp - stupendous)
    :precondition (and
      (texture ?t1)
      (texture ?t2)
      (next ?sn ?t1)
      (collect ?t1 ?stp)
      (collect ?t2 ?stp)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
    )
  )

  (:action memory
    :parameters (?c - cats ?s1 - obj ?s2 - obj)
    :precondition (and
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
    :parameters (?h - hand ?sn - sneeze ?t - obj)
    :precondition (and
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
    )
  )
)