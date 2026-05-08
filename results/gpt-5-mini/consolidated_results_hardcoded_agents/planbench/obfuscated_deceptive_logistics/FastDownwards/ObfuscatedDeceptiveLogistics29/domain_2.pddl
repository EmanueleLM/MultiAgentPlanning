(define (domain obfuscated-deceptive-logistics-29)
  (:requirements :strips :typing :negative-preconditions :derived-predicates)
  (:types node)

  (:predicates
    (next ?a - node ?b - node)         ; immediate ordering: ?a is immediately before ?b
    (hand ?x - node)
    (cats ?x - node)
    (texture ?x - node)
    (vase ?a - node ?b - node)
    (sneeze ?x - node)
    (stupendous ?x - node)
    (collect ?a - node ?b - node)
    (spring ?x - node)
  )

  ;; derived predicate: a node has an outgoing next iff there exists some successor
  (:derived (has-next ?a - node)
    (exists (?b - node) (next ?a ?b))
  )

  ;; paltry: creates a new outgoing next from ?a to ?c by using an existing link from ?b->?c and a vase between ?a and ?b.
  (:action paltry
    :parameters (?a - node ?b - node ?c - node)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (not (has-next ?a))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  ;; sip: consumes the outgoing next from ?a->?c (removing ?a's outgoing), requires also ?b->?c; produces vase ?a ?b
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

  ;; clip: similar to sip but requires sneeze on ?b and produces vase ?a ?b; consumes next ?a ?c
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

  ;; wretched: moves the outgoing from ?a from ?b to ?c, requires collect relations for ?b and ?c with stupendous ?d.
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

  ;; memory: moves the outgoing from ?a from ?b to ?c, requires springs and cats
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

  ;; tightfisted: creates a new outgoing next from ?a to ?c by using an existing link ?b->?c and a vase between ?a and ?b.
  (:action tightfisted
    :parameters (?a - node ?b - node ?c - node)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (not (has-next ?a))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )
)