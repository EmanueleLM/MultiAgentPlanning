(define (domain mystery-blocksworld-24)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (next ?x - object ?y - object)
    (vase ?x - object ?y - object)
    (hand ?x - object)
    (sneeze ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (collect ?x - object ?y - object)
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

  (:action sip
    :parameters (?h - object ?c - object ?s - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?s)
      (next ?h ?s)
      (next ?c ?s)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?s))
    )
  )

  (:action paltry
    :parameters (?h - object ?c - object ?s - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?s)
      (vase ?h ?c)
      (next ?c ?s)
    )
    :effect (and
      (next ?h ?s)
      (not (vase ?h ?c))
    )
  )
)