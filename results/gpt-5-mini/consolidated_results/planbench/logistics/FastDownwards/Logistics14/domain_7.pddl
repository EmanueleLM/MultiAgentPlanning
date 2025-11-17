(define (domain repoint-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types item step)

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
    ;; Stage progression predicates to enforce explicit, contiguous time/stage advancement
    (at-step ?s - step)
    (succ ?s1 ?s2 - step)
  )

  ;; paltry:
  ;; pre: hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z, at-step ?s and succ ?s ?s2 and not at-step ?s2
  ;; effect: add next ?x ?z, delete vase ?x ?y, move stage from ?s to ?s2
  (:action paltry
    :parameters (?x - item ?y - item ?z - item ?s - step ?s2 - step)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (at-step ?s)
      (succ ?s ?s2)
      (not (at-step ?s2))
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; sip:
  ;; pre: hand ?p, cats ?q, texture ?r, next ?p ?r, next ?q ?r, contiguous stage advance
  ;; effect: add vase ?p ?q, delete next ?p ?r, advance stage
  (:action sip
    :parameters (?p - item ?q - item ?r - item ?s - step ?s2 - step)
    :precondition (and
      (hand ?p)
      (cats ?q)
      (texture ?r)
      (next ?p ?r)
      (next ?q ?r)
      (at-step ?s)
      (succ ?s ?s2)
      (not (at-step ?s2))
    )
    :effect (and
      (vase ?p ?q)
      (not (next ?p ?r))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; clip:
  ;; pre: hand ?a, sneeze ?b, texture ?c, next ?b ?c, next ?a ?c, contiguous stage advance
  ;; effect: add vase ?a ?b, delete next ?a ?c, advance stage
  (:action clip
    :parameters (?a - item ?b - item ?c - item ?s - step ?s2 - step)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (at-step ?s)
      (succ ?s ?s2)
      (not (at-step ?s2))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; wretched:
  ;; pre: sneeze ?p, texture ?b, texture ?c, stupendous ?m, next ?p ?b, collect ?b ?m, collect ?c ?m, contiguous stage advance
  ;; effect: add next ?p ?c, delete next ?p ?b, advance stage
  (:action wretched
    :parameters (?p - item ?b - item ?c - item ?m - item ?s - step ?s2 - step)
    :precondition (and
      (sneeze ?p)
      (texture ?b)
      (texture ?c)
      (stupendous ?m)
      (next ?p ?b)
      (collect ?b ?m)
      (collect ?c ?m)
      (at-step ?s)
      (succ ?s ?s2)
      (not (at-step ?s2))
    )
    :effect (and
      (next ?p ?c)
      (not (next ?p ?b))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; memory:
  ;; pre: cats ?a, spring ?b, spring ?c, next ?a ?b, contiguous stage advance
  ;; effect: add next ?a ?c, delete next ?a ?b, advance stage
  (:action memory
    :parameters (?a - item ?b - item ?c - item ?s - step ?s2 - step)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (at-step ?s)
      (succ ?s ?s2)
      (not (at-step ?s2))
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; tightfisted:
  ;; pre: hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y, contiguous stage advance
  ;; effect: add next ?x ?z, delete vase ?x ?y, advance stage
  (:action tightfisted
    :parameters (?x - item ?y - item ?z - item ?s - step ?s2 - step)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (at-step ?s)
      (succ ?s ?s2)
      (not (at-step ?s2))
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)