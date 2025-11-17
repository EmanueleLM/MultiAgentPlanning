(define (domain obfuscated-deceptive-logistics3)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)

    ;; temporalized binary relations indexed by stage
    (next ?x - obj ?y - obj ?s - stage)
    (vase ?x - obj ?y - obj ?s - stage)

    ;; stage ordering (discrete time progression)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; sip(objectA,objectB,objectC) :
  ;; pre: hand A, cats B, texture C, next A C @ s, next B C @ s
  ;; eff: add vase A B @ s2, delete next A C @ s
  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c ?s)
      (next ?b ?c ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?a ?b ?s2)
      (not (next ?a ?c ?s))
    )
  )

  ;; clip(objectA,objectB,objectC) :
  ;; pre: hand A, sneeze B, texture C, next B C @ s, next A C @ s
  ;; eff: add vase A B @ s2, delete next A C @ s
  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?s)
      (next ?a ?c ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?a ?b ?s2)
      (not (next ?a ?c ?s))
    )
  )

  ;; paltry(objectA,objectB,objectC) :
  ;; pre: hand A, cats B, texture C, vase A B @ s, next B C @ s
  ;; eff: add next A C @ s2, delete vase A B @ s
  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b ?s)
      (next ?b ?c ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c ?s2)
      (not (vase ?a ?b ?s))
    )
  )

  ;; wretched(objectA,objectB,objectC,objectD) :
  ;; pre: sneeze X, texture Y, texture Z, stupendous C, next X Y @ s, collect Y C, collect Z C
  ;; eff: add next X Z @ s2, delete next X Y @ s
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?c)
      (next ?x ?y ?s)
      (collect ?y ?c)
      (collect ?z ?c)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z ?s2)
      (not (next ?x ?y ?s))
    )
  )

  ;; memory(objectA,objectB,objectC) :
  ;; pre: cats X, spring Y, spring Z, next X Y @ s
  ;; eff: add next X Z @ s2, delete next X Y @ s
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z ?s2)
      (not (next ?x ?y ?s))
    )
  )

  ;; tightfisted(objectA,objectB,objectC) :
  ;; pre: hand A, sneeze B, texture C, next B C @ s, vase A B @ s
  ;; eff: add next A C @ s2, delete vase A B @ s
  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c ?s)
      (vase ?a ?b ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c ?s2)
      (not (vase ?a ?b ?s))
    )
  )
)