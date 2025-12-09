(define (domain obfuscated-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types node stage)
  (:predicates
    (next ?x - node ?y - node)
    (vase ?x - node ?y - node)
    (collect ?x - node ?y - node)
    (hand ?x - node)
    (cats ?x - node)
    (texture ?x - node)
    (sneeze ?x - node)
    (spring ?x - node)
    (stupendous ?x - node)
    ;; Stage usage predicates to enforce ordered, contiguous stage assignment
    (used ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry object_0 object_1 object_2.
  ;; Preconditions plus explicit stage consumption: requires a predecessor stage ?p already used and consumes successor stage ?t.
  (:action paltry
    :parameters (?a - node ?b - node ?c - node ?p - stage ?t - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (succ ?p ?t)
      (used ?p)
      (not (used ?t))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (used ?t)
    )
  )

  ;; sip object_0 object_1 object_2.
  (:action sip
    :parameters (?a - node ?b - node ?c - node ?p - stage ?t - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (succ ?p ?t)
      (used ?p)
      (not (used ?t))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (used ?t)
    )
  )

  ;; clip object_0 object_1 object_2.
  (:action clip
    :parameters (?a - node ?b - node ?c - node ?p - stage ?t - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (succ ?p ?t)
      (used ?p)
      (not (used ?t))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (used ?t)
    )
  )

  ;; wretched object_0 object_1 object_2 object_3.
  (:action wretched
    :parameters (?a - node ?b - node ?c - node ?d - node ?p - stage ?t - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (succ ?p ?t)
      (used ?p)
      (not (used ?t))
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (used ?t)
    )
  )

  ;; memory object_0 object_1 object_2.
  (:action memory
    :parameters (?a - node ?b - node ?c - node ?p - stage ?t - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (succ ?p ?t)
      (used ?p)
      (not (used ?t))
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (used ?t)
    )
  )

  ;; tightfisted object_0 object_1 object_2.
  (:action tightfisted
    :parameters (?a - node ?b - node ?c - node ?p - stage ?t - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (succ ?p ?t)
      (used ?p)
      (not (used ?t))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (used ?t)
    )
  )
)