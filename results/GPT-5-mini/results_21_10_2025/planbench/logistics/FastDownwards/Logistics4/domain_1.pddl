(define (domain Logistics4-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (collect ?x - object ?y - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; Action: paltry
  ;; pre: hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z
  ;; effect: add next ?x ?z, remove vase ?x ?y
  (:action paltry
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; Action: sip
  ;; pre: hand ?x, cats ?y, texture ?z, next ?x ?z, next ?y ?z
  ;; effect: add vase ?x ?y, remove next ?x ?z
  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; Action: clip
  ;; pre: hand ?x, sneeze ?y, texture ?z, next ?y ?z, next ?x ?z
  ;; effect: add vase ?x ?y, remove next ?x ?z
  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; Action: wretched
  ;; pre: sneeze ?a, texture ?b, texture ?c, stupendous ?d, next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; effect: add next ?a ?c, remove next ?a ?b
  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; Action: memory
  ;; pre: cats ?x, spring ?y, spring ?z, next ?x ?y
  ;; effect: add next ?x ?z, remove next ?x ?y
  (:action memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; Action: tightfisted
  ;; pre: hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y
  ;; effect: add next ?x ?z, remove vase ?x ?y
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

)