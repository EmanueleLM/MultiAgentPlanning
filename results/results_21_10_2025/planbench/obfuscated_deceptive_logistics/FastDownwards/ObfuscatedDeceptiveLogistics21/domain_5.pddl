(define (domain ObfuscatedDeceptiveLogistics21)
  (:requirements :typing :negative-preconditions)
  (:types object)

  (:predicates
    (cats ?o - object)
    (hand ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (collect ?a - object ?b - object)
    (next ?a - object ?b - object)
    (vase ?a - object ?b - object)
  )

  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t))
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t))
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t))
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?s - object ?a - object ?b - object ?c - object)
    :precondition (and
      (sneeze ?s)
      (texture ?a)
      (texture ?b)
      (stupendous ?c)
      (next ?s ?a)
      (collect ?a ?c)
      (collect ?b ?c))
    :effect (and
      (next ?s ?b)
      (not (next ?s ?a))
    )
  )

  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1))
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
      (vase ?h ?s))
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)