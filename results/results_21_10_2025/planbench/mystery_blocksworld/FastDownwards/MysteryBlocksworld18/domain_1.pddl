(define (domain mystery-blocks-18)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (collect ?x ?y)
    (spring ?x)
    (stupendous ?x)
  )

  ;; paltry(hand H, cats C, texture T, vase H C, next C T)
  ;; Effects: add next H T, delete vase H C
  (:action paltry
    :parameters (?h ?c ?t)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip(hand H, cats C, texture T, next H T, next C T)
  ;; Effects: add vase H C, delete next H T
  (:action sip
    :parameters (?h ?c ?t)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip(hand H, sneeze S, texture T, next S T, next H T)
  ;; Effects: add vase H S, delete next H T
  (:action clip
    :parameters (?h ?s ?t)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched(sneeze A, texture B, texture C, stupendous D, next A B, collect B D, collect C D)
  ;; Effects: add next A C, delete next A B
  (:action wretched
    :parameters (?a ?b ?c ?d)
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

  ;; memory(cats C, spring Y, spring Z, next C Y)
  ;; Effects: add next C Z, delete next C Y
  (:action memory
    :parameters (?c ?y ?z)
    :precondition (and
      (cats ?c)
      (spring ?y)
      (spring ?z)
      (next ?c ?y)
    )
    :effect (and
      (next ?c ?z)
      (not (next ?c ?y))
    )
  )

  ;; tightfisted(hand H, sneeze S, texture T, next S T, vase H S)
  ;; Effects: add next H T, delete vase H S
  (:action tightfisted
    :parameters (?h ?s ?t)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)