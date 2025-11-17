(define (domain repoint-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types item)

  (:predicates
    (hand ?o - item)
    (cats ?o - item)
    (texture ?o - item)
    (vase ?a ?b - item)
    (next ?a ?b - item)
    (collect ?a ?b - item)
    (sneeze ?o - item)
    (stupendous ?o - item)
    (spring ?o - item)
  )

  ;; paltry:
  ;; pre: hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z
  ;; effect: add next ?x ?z, delete vase ?x ?y
  (:action paltry
    :parameters (?x - item ?y - item ?z - item)
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

  ;; sip:
  ;; pre: hand ?p, cats ?q, texture ?r, next ?p ?r, next ?q ?r
  ;; effect: add vase ?p ?q, delete next ?p ?r
  (:action sip
    :parameters (?p - item ?q - item ?r - item)
    :precondition (and
      (hand ?p)
      (cats ?q)
      (texture ?r)
      (next ?p ?r)
      (next ?q ?r)
    )
    :effect (and
      (vase ?p ?q)
      (not (next ?p ?r))
    )
  )

  ;; clip:
  ;; pre: hand ?a, sneeze ?b, texture ?c, next ?b ?c, next ?a ?c
  ;; effect: add vase ?a ?b, delete next ?a ?c
  (:action clip
    :parameters (?a - item ?b - item ?c - item)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; wretched:
  ;; pre: sneeze ?p, texture ?b, texture ?c, stupendous ?m, next ?p ?b, collect ?b ?m, collect ?c ?m
  ;; effect: add next ?p ?c, delete next ?p ?b
  (:action wretched
    :parameters (?p - item ?b - item ?c - item ?m - item)
    :precondition (and
      (sneeze ?p)
      (texture ?b)
      (texture ?c)
      (stupendous ?m)
      (next ?p ?b)
      (collect ?b ?m)
      (collect ?c ?m)
    )
    :effect (and
      (next ?p ?c)
      (not (next ?p ?b))
    )
  )

  ;; memory:
  ;; pre: cats ?a, spring ?b, spring ?c, next ?a ?b
  ;; effect: add next ?a ?c, delete next ?a ?b
  (:action memory
    :parameters (?a - item ?b - item ?c - item)
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

  ;; tightfisted:
  ;; pre: hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y
  ;; effect: add next ?x ?z, delete vase ?x ?y
  (:action tightfisted
    :parameters (?x - item ?y - item ?z - item)
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