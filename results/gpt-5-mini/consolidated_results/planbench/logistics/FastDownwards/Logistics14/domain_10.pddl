(define (domain repoint-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types item stage)

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

    ;; explicit scheduling / stage objects to enforce discrete ordered stages
    (is_stage ?s - stage)
    (succ ?s1 ?s2 - stage)        ;; successor relation over stages
    (available ?s - stage)        ;; stage availability token; consumed by an action
  )

  ;; paltry:
  ;; pre: hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z, succ ?prev ?st, available ?st, not available ?prev
  ;; effect: add next ?x ?z, delete vase ?x ?y, consume available ?st
  (:action paltry
    :parameters (?x - item ?y - item ?z - item ?prev - stage ?st - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (succ ?prev ?st)
      (available ?st)
      (not (available ?prev))
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (available ?st))
    )
  )

  ;; sip:
  ;; pre: hand ?p, cats ?q, texture ?r, next ?p ?r, next ?q ?r, succ ?prev ?st, available ?st, not available ?prev
  ;; effect: add vase ?p ?q, delete next ?p ?r, consume available ?st
  (:action sip
    :parameters (?p - item ?q - item ?r - item ?prev - stage ?st - stage)
    :precondition (and
      (hand ?p)
      (cats ?q)
      (texture ?r)
      (next ?p ?r)
      (next ?q ?r)
      (succ ?prev ?st)
      (available ?st)
      (not (available ?prev))
    )
    :effect (and
      (vase ?p ?q)
      (not (next ?p ?r))
      (not (available ?st))
    )
  )

  ;; clip:
  ;; pre: hand ?a, sneeze ?b, texture ?c, next ?b ?c, next ?a ?c, succ ?prev ?st, available ?st, not available ?prev
  ;; effect: add vase ?a ?b, delete next ?a ?c, consume available ?st
  (:action clip
    :parameters (?a - item ?b - item ?c - item ?prev - stage ?st - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (succ ?prev ?st)
      (available ?st)
      (not (available ?prev))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (available ?st))
    )
  )

  ;; wretched:
  ;; pre: sneeze ?p, texture ?b, texture ?c, stupendous ?m, next ?p ?b, collect ?b ?m, collect ?c ?m, succ ?prev ?st, available ?st, not available ?prev
  ;; effect: add next ?p ?c, delete next ?p ?b, consume available ?st
  (:action wretched
    :parameters (?p - item ?b - item ?c - item ?m - item ?prev - stage ?st - stage)
    :precondition (and
      (sneeze ?p)
      (texture ?b)
      (texture ?c)
      (stupendous ?m)
      (next ?p ?b)
      (collect ?b ?m)
      (collect ?c ?m)
      (succ ?prev ?st)
      (available ?st)
      (not (available ?prev))
    )
    :effect (and
      (next ?p ?c)
      (not (next ?p ?b))
      (not (available ?st))
    )
  )

  ;; memory:
  ;; pre: cats ?a, spring ?b, spring ?c, next ?a ?b, succ ?prev ?st, available ?st, not available ?prev
  ;; effect: add next ?a ?c, delete next ?a ?b, consume available ?st
  (:action memory
    :parameters (?a - item ?b - item ?c - item ?prev - stage ?st - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (succ ?prev ?st)
      (available ?st)
      (not (available ?prev))
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (available ?st))
    )
  )

  ;; tightfisted:
  ;; pre: hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y, succ ?prev ?st, available ?st, not available ?prev
  ;; effect: add next ?x ?z, delete vase ?x ?y, consume available ?st
  (:action tightfisted
    :parameters (?x - item ?y - item ?z - item ?prev - stage ?st - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (succ ?prev ?st)
      (available ?st)
      (not (available ?prev))
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (available ?st))
    )
  )
)