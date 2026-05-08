(define (domain obfuscated_deceptive_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (next ?a - object ?b - object)
    (vase ?a - object ?b - object)
    (hand ?a - object)
    (cats ?a - object)
    (texture ?a - object)
    (sneeze ?a - object)
    (spring ?a - object)
    (stupendous ?a - object)
    (collect ?a - object ?b - object)
  )

  (:action paltry
    :parameters (?h - object ?x - object ?y - object)
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
    :parameters (?h - object ?x - object ?y - object)
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
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?u - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?u)
      (next ?s ?t1)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
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
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )

)