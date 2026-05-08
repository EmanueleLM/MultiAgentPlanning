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
    ;; Stage occupancy to enforce explicit discrete-stage usage (no reuse).
    (occupied ?t - stage)
    ;; Successor relation between stages (purely structural, provided in init).
    (succ ?t1 - stage ?t2 - stage)
  )

  ;; paltry object_0 object_1 object_2.
  (:action paltry
    :parameters (?a - node ?b - node ?c - node ?t - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (not (occupied ?t))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (occupied ?t)
    )
  )

  ;; sip object_0 object_1 object_2.
  (:action sip
    :parameters (?a - node ?b - node ?c - node ?t - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (not (occupied ?t))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (occupied ?t)
    )
  )

  ;; clip object_0 object_1 object_2.
  (:action clip
    :parameters (?a - node ?b - node ?c - node ?t - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (not (occupied ?t))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (occupied ?t)
    )
  )

  ;; wretched object_0 object_1 object_2 object_3.
  (:action wretched
    :parameters (?a - node ?b - node ?c - node ?d - node ?t - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (not (occupied ?t))
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (occupied ?t)
    )
  )

  ;; memory object_0 object_1 object_2.
  (:action memory
    :parameters (?a - node ?b - node ?c - node ?t - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (not (occupied ?t))
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (occupied ?t)
    )
  )

  ;; tightfisted object_0 object_1 object_2.
  (:action tightfisted
    :parameters (?a - node ?b - node ?c - node ?t - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (not (occupied ?t))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (occupied ?t)
    )
  )
)