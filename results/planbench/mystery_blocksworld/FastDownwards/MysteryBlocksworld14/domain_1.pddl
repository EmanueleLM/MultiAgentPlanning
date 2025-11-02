(define (domain mysteryblocksworld14)
  (:requirements :strips :typing)
  (:types entity)

  (:predicates
    (cats ?x - entity)
    (hand ?x - entity)
    (sneeze ?x - entity)
    (spring ?x - entity)
    (stupendous ?x - entity)
    (texture ?x - entity)
    (next ?x - entity ?y - entity)
    (vase ?x - entity ?y - entity)
    (collect ?x - entity ?y - entity)
  )

  (:action paltry
    :parameters (?a - entity ?c - entity ?t - entity)
    :precondition (and
      (hand ?a)
      (cats ?c)
      (texture ?t)
      (vase ?a ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?a ?t)
      (not (vase ?a ?c))
    )
  )

  (:action sip
    :parameters (?a - entity ?c - entity ?t - entity)
    :precondition (and
      (hand ?a)
      (cats ?c)
      (texture ?t)
      (next ?a ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?a ?c)
      (not (next ?a ?t))
    )
  )

  (:action clip
    :parameters (?a - entity ?s - entity ?t - entity)
    :precondition (and
      (hand ?a)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?a ?t)
    )
    :effect (and
      (vase ?a ?s)
      (not (next ?a ?t))
    )
  )

  (:action wretched
    :parameters (?s - entity ?t1 - entity ?t2 - entity ?r - entity)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?r)
      (next ?s ?t1)
      (collect ?t1 ?r)
      (collect ?t2 ?r)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action memory
    :parameters (?c - entity ?t1 - entity ?t2 - entity)
    :precondition (and
      (cats ?c)
      (spring ?t1)
      (spring ?t2)
      (next ?c ?t1)
    )
    :effect (and
      (next ?c ?t2)
      (not (next ?c ?t1))
    )
  )

  (:action tightfisted
    :parameters (?a - entity ?s - entity ?t - entity)
    :precondition (and
      (hand ?a)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?a ?s)
    )
    :effect (and
      (next ?a ?t)
      (not (vase ?a ?s))
    )
  )
)