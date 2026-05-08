(define (domain obfuscated_deceptive_logistics18)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; paltry: requires hand, cats, texture and a vase relation + a next link; replaces vase by a next link
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip: requires hand, cats, texture and two next links; creates a vase and removes one next link
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip: requires hand, sneeze, texture and two next links; creates a vase and removes one next link
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched: rewires a next link from ?from to ?to if collect relations and stupendous hold
  (:action wretched
    :parameters (?x - object ?from - object ?to - object ?u - object)
    :precondition (and
      (sneeze ?x)
      (texture ?from)
      (texture ?to)
      (stupendous ?u)
      (next ?x ?from)
      (collect ?from ?u)
      (collect ?to ?u)
    )
    :effect (and
      (next ?x ?to)
      (not (next ?x ?from))
    )
  )

  ;; memory: moves a next relation from ?from to ?to for a cats object if both springs exist
  (:action memory
    :parameters (?c - object ?from - object ?to - object)
    :precondition (and
      (cats ?c)
      (spring ?from)
      (spring ?to)
      (next ?c ?from)
    )
    :effect (and
      (next ?c ?to)
      (not (next ?c ?from))
    )
  )

  ;; tightfisted: requires a vase and a next link; converts vase into a next link
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)