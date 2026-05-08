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

  ;; paltry: uses a contiguous stage transition (current ?t -> current ?t2).
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

  ;; sip: produces a vase between ?a and ?b if both point to same ?c; consumes the contiguous stage.
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

  ;; clip: similar to sip but requires sneeze on ?b; creates vase and removes next ?a->?c; uses contiguous stage.
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

  ;; wretched: moves next relation from ?b to ?c for ?a given sneeze on ?a, textures on ?b and ?c,
  ;; stupendous on ?d, and collect facts linking both ?b and ?c to ?d. Uses contiguous stage.
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

  ;; memory: moves next for a cats-bearing node from a spring-node to another spring-node; contiguous stage.
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

  ;; tightfisted: uses an existing vase and next ?b->?c to give ?a the same next; contiguous stage.
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