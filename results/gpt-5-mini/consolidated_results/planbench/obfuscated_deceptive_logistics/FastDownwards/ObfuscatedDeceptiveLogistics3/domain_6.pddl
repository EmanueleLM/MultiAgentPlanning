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

    ;; relational facts indexed by a stage
    (next ?x - obj ?y - obj ?s - stage)
    (vase ?x - obj ?y - obj ?s - stage)

    ;; stage ordering
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; sip(objectA,objectB,objectC) at stage ?s -> effects appear at successor stage ?s2
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

  ;; clip(objectA,objectB,objectC)
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

  ;; paltry(objectA,objectB,objectC)
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

  ;; wretched(objectA,objectB,objectC,objectD)
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

  ;; memory(objectA,objectB,objectC)
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

  ;; tightfisted(objectA,objectB,objectC)
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