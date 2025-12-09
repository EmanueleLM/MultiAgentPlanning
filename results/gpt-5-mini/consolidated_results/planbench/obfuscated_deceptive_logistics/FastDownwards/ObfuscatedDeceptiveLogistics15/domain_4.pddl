(define (domain obfuscated-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types node)
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
  )

  ;; paltry object_0 object_1 object_2.
  ;; Preconditions: hand ?a, cats ?b, texture ?c, vase ?a ?b, next ?b ?c
  ;; Effects: add next ?a ?c, delete vase ?a ?b
  (:action paltry
    :parameters (?a - node ?b - node ?c - node)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  ;; sip object_0 object_1 object_2.
  ;; Preconditions: hand ?a, cats ?b, texture ?c, next ?a ?c, next ?b ?c
  ;; Effects: add vase ?a ?b, delete next ?a ?c
  (:action sip
    :parameters (?a - node ?b - node ?c - node)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; clip object_0 object_1 object_2.
  ;; Preconditions: hand ?a, sneeze ?b, texture ?c, next ?b ?c, next ?a ?c
  ;; Effects: add vase ?a ?b, delete next ?a ?c
  (:action clip
    :parameters (?a - node ?b - node ?c - node)
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

  ;; wretched object_0 object_1 object_2 object_3.
  ;; Preconditions: sneeze ?a, texture ?b, texture ?c, stupendous ?d, next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; Effects: add next ?a ?c, delete next ?a ?b
  (:action wretched
    :parameters (?a - node ?b - node ?c - node ?d - node)
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

  ;; memory object_0 object_1 object_2.
  ;; Preconditions: cats ?a, spring ?b, spring ?c, next ?a ?b
  ;; Effects: add next ?a ?c, delete next ?a ?b
  (:action memory
    :parameters (?a - node ?b - node ?c - node)
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

  ;; tightfisted object_0 object_1 object_2.
  ;; Preconditions: hand ?a, sneeze ?b, texture ?c, next ?b ?c, vase ?a ?b
  ;; Effects: add next ?a ?c, delete vase ?a ?b
  (:action tightfisted
    :parameters (?a - node ?b - node ?c - node)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )
)