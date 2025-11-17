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
    (at-step ?s - step)
    (succ ?s1 ?s2 - step)
  )

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
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

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
    )
    :effect (and
      (vase ?p ?q)
      (not (next ?p ?r))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

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
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

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
    )
    :effect (and
      (next ?p ?c)
      (not (next ?p ?b))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action memory
    :parameters (?a - item ?b - item ?c - item ?s - step ?s2 - step)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

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
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)