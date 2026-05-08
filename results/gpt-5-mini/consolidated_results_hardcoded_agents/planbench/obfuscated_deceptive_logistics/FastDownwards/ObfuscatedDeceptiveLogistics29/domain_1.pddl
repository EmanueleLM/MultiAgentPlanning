(define (domain obfuscated-deceptive-logistics-29)
  (:requirements :strips :typing :negative-preconditions)
  (:types node)

  (:predicates
    (next ?a - node ?b - node)         ; immediate ordering: ?a is immediately before ?b
    (has-next ?a - node)               ; explicit structural predicate: ?a currently has an outgoing next
    (hand ?x - node)
    (cats ?x - node)
    (texture ?x - node)
    (vase ?a - node ?b - node)
    (sneeze ?x - node)
    (stupendous ?x - node)
    (collect ?a - node ?b - node)
    (spring ?x - node)
  )

  ;; paltry: creates a new outgoing next from ?a to ?c by using an existing link from ?b->?c and a vase between ?a and ?b.
  ;; Enforce that ?a has no other outgoing next before creating the new link.
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
      (has-next ?a)
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
      (not (has-next ?a))
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
      (not (has-next ?a))
    )
  )

  ;; wretched: moves the outgoing from ?a from ?b to ?c, requires collect relations for ?b and ?c with stupendous ?d.
  ;; This preserves has-next for ?a (it replaces the outgoing in one action).
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
      ;; has-next remains true because outgoing is replaced, no change to has-next
    )
  )

  ;; memory: moves the outgoing from ?a from ?b to ?c, requires springs and cats; similar to wretched for has-next
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
      ;; has-next preserved (outgoing replaced)
    )
  )

  ;; tightfisted: creates a new outgoing next from ?a to ?c by using an existing link ?b->?c and a vase between ?a and ?b.
  ;; Enforce that ?a currently has no outgoing next.
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
      (has-next ?a)
      (not (vase ?a ?b))
    )
  )
)