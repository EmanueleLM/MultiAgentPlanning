(define (domain MysteryBlocksworld17)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (collect ?a - obj ?b - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; paltry(A,B,C):
  ;; pre: hand A, cats B, texture C, vase A B, next B C
  ;; add: next A C
  ;; del: vase A B
  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj)
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

  ;; sip(A,B,C):
  ;; pre: hand A, cats B, texture C, next A C, next B C
  ;; add: vase A B
  ;; del: next A C
  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj)
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

  ;; clip(A,B,C):
  ;; pre: hand A, sneeze B, texture C, next B C, next A C
  ;; add: vase A B
  ;; del: next A C
  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj)
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

  ;; wretched(A,B,C,D):
  ;; pre: sneeze A, texture B, texture C, stupendous D, next A B, collect B D, collect C D
  ;; add: next A C
  ;; del: next A B
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
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

  ;; memory(A,B,C):
  ;; pre: cats A, spring B, spring C, next A B
  ;; add: next A C
  ;; del: next A B
  (:action memory
    :parameters (?a - obj ?b - obj ?c - obj)
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

  ;; tightfisted(A,B,C):
  ;; pre: hand A, sneeze B, texture C, next B C, vase A B
  ;; add: next A C
  ;; del: vase A B
  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
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