(define (domain obfuscated-deceptive-logistics3)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)

    (next ?x - obj ?y - obj ?t - time)
    (vase ?x - obj ?y - obj ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  ;; sip(objectA,objectB,objectC)
  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c ?t)
      (next ?b ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b ?t2)
      (not (next ?a ?c ?t))
    )
  )

  ;; clip(objectA,objectB,objectC)
  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?t)
      (next ?a ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b ?t2)
      (not (next ?a ?c ?t))
    )
  )

  ;; paltry(objectA,objectB,objectC)
  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b ?t)
      (next ?b ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c ?t2)
      (not (vase ?a ?b ?t))
    )
  )

  ;; wretched(objectA,objectB,objectC,objectD)
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next ?x ?y ?t)
      (collect ?y ?c)
      (collect ?z ?c)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z ?t2)
      (not (next ?x ?y ?t))
    )
  )

  ;; memory(objectA,objectB,objectC)
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t2 - time)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z ?t2)
      (not (next ?x ?y ?t))
    )
  )

  ;; tightfisted(objectA,objectB,objectC)
  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?t)
      (vase ?a ?b ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c ?t2)
      (not (vase ?a ?b ?t))
    )
  )
)