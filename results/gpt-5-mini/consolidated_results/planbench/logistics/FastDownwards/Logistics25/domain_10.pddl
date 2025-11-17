(define (domain Logistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (cats ?o - object)
    (collect ?o1 - object ?o2 - object)
    (hand ?o - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (curr ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (curr ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (not (curr ?s))
      (curr ?s2)
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (curr ?s)
      (succ ?s ?s2)
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (not (curr ?s))
      (curr ?s2)
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - object ?sn - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (curr ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
    )
    :effect (and
      (not (curr ?s))
      (curr ?s2)
      (vase ?h ?sn)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object ?s - stage ?s2 - stage)
    :precondition (and
      (curr ?s)
      (succ ?s ?s2)
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (not (curr ?s))
      (curr ?s2)
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action memory
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (curr ?s)
      (succ ?s ?s2)
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (not (curr ?s))
      (curr ?s2)
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action tightfisted
    :parameters (?h - object ?sn - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (curr ?s)
      (succ ?s ?s2)
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
    )
    :effect (and
      (not (curr ?s))
      (curr ?s2)
      (next ?h ?t)
      (not (vase ?h ?sn))
    )
  )

)