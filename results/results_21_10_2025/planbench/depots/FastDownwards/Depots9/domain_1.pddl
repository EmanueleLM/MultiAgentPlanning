(define (domain Depots9)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (spring ?o - obj)
  )

  ;; paltry: requires hand ?a, cats ?b, texture ?c, vase ?a ?b, next ?b ?c
  ;; effects: add next ?a ?c, delete vase ?a ?b
  (:action paltry
    :parameters (?pa - obj ?pb - obj ?pc - obj)
    :precondition (and
      (hand ?pa)
      (cats ?pb)
      (texture ?pc)
      (vase ?pa ?pb)
      (next ?pb ?pc)
    )
    :effect (and
      (next ?pa ?pc)
      (not (vase ?pa ?pb))
    )
  )

  ;; sip: requires hand ?a, cats ?b, texture ?c, next ?a ?c, next ?b ?c
  ;; effects: add vase ?a ?b, delete next ?a ?c
  (:action sip
    :parameters (?sa - obj ?sb - obj ?sc - obj)
    :precondition (and
      (hand ?sa)
      (cats ?sb)
      (texture ?sc)
      (next ?sa ?sc)
      (next ?sb ?sc)
    )
    :effect (and
      (vase ?sa ?sb)
      (not (next ?sa ?sc))
    )
  )

  ;; clip: requires hand ?a, sneeze ?b, texture ?c, next ?b ?c, next ?a ?c
  ;; effects: add vase ?a ?b, delete next ?a ?c
  (:action clip
    :parameters (?ca - obj ?cb - obj ?cc - obj)
    :precondition (and
      (hand ?ca)
      (sneeze ?cb)
      (texture ?cc)
      (next ?cb ?cc)
      (next ?ca ?cc)
    )
    :effect (and
      (vase ?ca ?cb)
      (not (next ?ca ?cc))
    )
  )

  ;; wretched: requires sneeze ?a, texture ?b, texture ?c, stupendous ?d, next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; effects: add next ?a ?c, delete next ?a ?b
  (:action wretched
    :parameters (?wa - obj ?wb - obj ?wc - obj ?wd - obj)
    :precondition (and
      (sneeze ?wa)
      (texture ?wb)
      (texture ?wc)
      (stupendous ?wd)
      (next ?wa ?wb)
      (collect ?wb ?wd)
      (collect ?wc ?wd)
    )
    :effect (and
      (next ?wa ?wc)
      (not (next ?wa ?wb))
    )
  )

  ;; memory: requires cats ?a, spring ?b, spring ?c, next ?a ?b
  ;; effects: add next ?a ?c, delete next ?a ?b
  (:action memory
    :parameters (?ma - obj ?mb - obj ?mc - obj)
    :precondition (and
      (cats ?ma)
      (spring ?mb)
      (spring ?mc)
      (next ?ma ?mb)
    )
    :effect (and
      (next ?ma ?mc)
      (not (next ?ma ?mb))
    )
  )

  ;; tightfisted: requires hand ?a, sneeze ?b, texture ?c, next ?b ?c, vase ?a ?b
  ;; effects: add next ?a ?c, delete vase ?a ?b
  (:action tightfisted
    :parameters (?ta - obj ?tb - obj ?tc - obj)
    :precondition (and
      (hand ?ta)
      (sneeze ?tb)
      (texture ?tc)
      (next ?tb ?tc)
      (vase ?ta ?tb)
    )
    :effect (and
      (next ?ta ?tc)
      (not (vase ?ta ?tb))
    )
  )
)