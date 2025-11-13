(define (domain obfuscated-deceptive-logistics3)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)

    ;; time-indexed relations; next and vase are indexed by a time stage
    (next ?x - obj ?y - obj ?t - time)
    (vase ?x - obj ?y - obj ?t - time)

    ;; time ordering
    (succ ?t1 - time ?t2 - time)
  )

  ;; sip(objectA,objectB,objectC)
  ;; pre: hand A, cats B, texture C, next A C @t, next B C @t
  ;; add: vase A B @t2, del: next A C @t
  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c ?t)
      (next ?b ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b ?t2)
      (not (next ?a ?c ?t))
    )
  )

  ;; clip(objectA,objectB,objectC)
  ;; pre: hand A, sneeze B, texture C, next B C @t, next A C @t
  ;; add: vase A B @t2, del: next A C @t
  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?t)
      (next ?a ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?a ?b ?t2)
      (not (next ?a ?c ?t))
    )
  )

  ;; paltry(objectA,objectB,objectC)
  ;; pre: hand A, cats B, texture C, vase A B @t, next B C @t
  ;; add: next A C @t2, del: vase A B @t
  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b ?t)
      (next ?b ?c ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c ?t2)
      (not (vase ?a ?b ?t))
    )
  )

  ;; wretched(objectA,objectB,objectC,objectD)
  ;; pre: sneeze X, texture Y, texture Z, stupendous C, next X Y @t, collect Y C, collect Z C
  ;; add: next X Z @t2, del: next X Y @t
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next ?x ?y ?t)
      (collect ?y ?c)
      (collect ?z ?c)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z ?t2)
      (not (next ?x ?y ?t))
    )
  )

  ;; memory(objectA,objectB,objectC)
  ;; pre: cats X, spring Y, spring Z, next X Y @t
  ;; add: next X Z @t2, del: next X Y @t
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - time ?t2 - time)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z ?t2)
      (not (next ?x ?y ?t))
    )
  )

  ;; tightfisted(objectA,objectB,objectC)
  ;; pre: hand A, sneeze B, texture C, next B C @t, vase A B @t
  ;; add: next A C @t2, del: vase A B @t
  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj ?t - time ?t2 - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?t)
      (vase ?a ?b ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?a ?c ?t2)
      (not (vase ?a ?b ?t))
    )
  )
)