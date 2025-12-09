(define (domain object_playground)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (sneeze ?o - object)
    (collect ?x - object ?y - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (now ?t - step)
    (succ ?t1 - step ?t2 - step)
  )

  (:action paltry
    :parameters (?x - object ?y - object ?z - object ?s - step ?s2 - step)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (now ?s))
      (now ?s2)
    )
  )

  (:action sip
    :parameters (?x - object ?y - object ?z - object ?s - step ?s2 - step)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (now ?s))
      (now ?s2)
    )
  )

  (:action clip
    :parameters (?x - object ?y - object ?z - object ?s - step ?s2 - step)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (now ?s))
      (now ?s2)
    )
  )

  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object ?s - step ?s2 - step)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (now ?s))
      (now ?s2)
    )
  )

  (:action memory
    :parameters (?a - object ?b - object ?c - object ?s - step ?s2 - step)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (now ?s))
      (now ?s2)
    )
  )

  (:action tightfisted
    :parameters (?a - object ?b - object ?c - object ?s - step ?s2 - step)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (now ?s))
      (now ?s2)
    )
  )
)