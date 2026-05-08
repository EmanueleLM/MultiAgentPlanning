(define (domain obfuscated_deceptive_logistics19)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (cats ?o - object)
    (hand ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?a - object ?b - object)
  )

  ;; paltry: hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z
  ;; effects: add next ?x ?z, delete vase ?x ?y
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

  ;; sip: hand ?x, cats ?y, texture ?z, next ?x ?z, next ?y ?z
  ;; effects: add vase ?x ?y, delete next ?x ?z
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

  ;; clip: hand ?x, sneeze ?y, texture ?z, next ?y ?z, next ?x ?z
  ;; effects: add vase ?x ?y, delete next ?x ?z
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

  ;; wretched: sneeze ?a, texture ?b, texture ?c, stupendous ?d,
  ;;           next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; effects: add next ?a ?c, delete next ?a ?b
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

  ;; memory: cats ?a, spring ?b, spring ?c, next ?a ?b
  ;; effects: add next ?a ?c, delete next ?a ?b
  (:action memory
    :parameters (?a - object ?b - object ?c - object)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; tightfisted: hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y
  ;; effects: add next ?x ?z, delete vase ?x ?y
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