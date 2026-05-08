(define (domain obfuscated-deceptive-logistics-29)
  (:requirements :strips :typing :negative-preconditions)
  (:types node stage)

  (:predicates
    (next ?a - node ?b - node)
    (hand ?x - node)
    (cats ?x - node)
    (texture ?x - node)
    (vase ?a - node ?b - node)
    (sneeze ?x - node)
    (stupendous ?x - node)
    (collect ?a - node ?b - node)
    (spring ?x - node)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry: requires vase between ?a and ?b and an existing next ?b->?c; creates next ?a->?c and removes the vase.
  (:action paltry
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; sip: requires next ?a->?c and ?b->?c, produces vase ?a ?b and deletes next ?a->?c.
  (:action sip
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; clip: requires next ?b->?c and next ?a->?c and sneeze on ?b; produces vase ?a ?b and deletes next ?a->?c.
  (:action clip
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; wretched: moves next of ?a from ?b to ?c if sneeze on ?a, textures on ?b and ?c, stupendous ?d, and collect relations for both ?b and ?c with ?d.
  (:action wretched
    :parameters (?a - node ?b - node ?c - node ?d - node ?t - stage ?t2 - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; memory: moves next of ?a from ?b to ?c if cats on ?a and springs on ?b and ?c.
  (:action memory
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; tightfisted: requires vase between ?a and ?b and next ?b->?c; creates next ?a->?c and removes the vase.
  (:action tightfisted
    :parameters (?a - node ?b - node ?c - node ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (current ?t))
      (current ?t2)
    )
  )
)