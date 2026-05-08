(define (domain obfuscated_deceptive_logistics25)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (sneeze ?o - object)
    (collect ?x - object ?y - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; paltry: requires hand X, cats Y, texture Z, vase X Y, next Y Z
  ;; effects: add next X Z, delete vase X Y
  (:action paltry
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; sip: requires hand X, cats Y, texture Z, next X Z, next Y Z
  ;; effects: add vase X Y, delete next X Z
  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; clip: requires hand X, sneeze Y, texture Z, next Y Z, next X Z
  ;; effects: add vase X Y, delete next X Z
  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; wretched: requires sneeze A, texture B, texture C, stupendous D,
  ;;           next A B, collect B D, collect C D
  ;; effects: add next A C, delete next A B
  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object)
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
  ;; effects: add next A C, delete next A B
  (:action memory
    :parameters (?a - object ?b - object ?c - object)
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
  ;; effects: add next A C, delete vase A B
  (:action tightfisted
    :parameters (?a - object ?b - object ?c - object)
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