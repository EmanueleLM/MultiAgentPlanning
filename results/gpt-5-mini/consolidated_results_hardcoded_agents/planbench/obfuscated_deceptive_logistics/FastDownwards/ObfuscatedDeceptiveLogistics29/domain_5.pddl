(define (domain obfuscated-deceptive-logistics-29)
  (:requirements :strips :typing :negative-preconditions)
  (:types node stage)

  (:predicates
    (next ?a - node ?b - node)
    (hand ?x - node)
    (cats ?x - node)
    (texture ?x - node)
    (vase ?a - node ?b - node)
    (sneeze ?x - node)
    (stupendous ?x - node)
    (collect ?a - node ?b - node)
    (spring ?x - node)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action paltry
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action sip
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action clip
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action wretched
    :parameters (?a - node ?b - node ?c - node ?d - node ?t - stage ?t2 - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action memory
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action tightfisted
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (current ?t))
      (current ?t2)
    )
  )
)