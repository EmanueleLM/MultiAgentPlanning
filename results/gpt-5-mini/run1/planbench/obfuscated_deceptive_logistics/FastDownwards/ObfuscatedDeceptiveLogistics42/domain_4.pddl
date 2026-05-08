(define (domain obfuscated_deceptive_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity)

  (:predicates
    (hand ?x - entity)
    (cats ?x - entity)
    (texture ?x - entity)
    (sneeze ?x - entity)
    (spring ?x - entity)
    (stupendous ?x - entity)

    (vase ?x - entity ?y - entity)
    (next ?x - entity ?y - entity)
    (collect ?x - entity ?y - entity)
  )

  ;; paltry: requires hand A, cats B, texture C, vase A B, next B C
  ;; effects: add next A C, remove vase A B
  (:action paltry
    :parameters (?a - entity ?b - entity ?c - entity)
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

  ;; sip: requires hand A, cats B, texture C, next A C, next B C
  ;; effects: add vase A B, remove next A C
  (:action sip
    :parameters (?a - entity ?b - entity ?c - entity)
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

  ;; clip: requires hand A, sneeze B, texture C, next B C, next A C
  ;; effects: add vase A B, remove next A C
  (:action clip
    :parameters (?a - entity ?b - entity ?c - entity)
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

  ;; wretched: requires sneeze A, texture B, texture C, stupendous D,
  ;;           next A B, collect B D, collect C D
  ;; effects: add next A C, remove next A B
  (:action wretched
    :parameters (?a - entity ?b - entity ?c - entity ?d - entity)
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

  ;; memory: requires cats A, spring B, spring C, next A B
  ;; effects: add next A C, remove next A B
  (:action memory
    :parameters (?a - entity ?b - entity ?c - entity)
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

  ;; tightfisted: requires hand A, sneeze B, texture C, next B C, vase A B
  ;; effects: add next A C, remove vase A B
  (:action tightfisted
    :parameters (?a - entity ?b - entity ?c - entity)
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