(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (cats ?o - obj)
    (hand ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a ?b - obj)
    (next ?a ?b - obj)
    (vase ?x ?y - obj)
  )

  ;; sip: requires an existing link next(X,Z) and next(Y,Z); consumes next(X,Z) and creates vase(X,Y)
  (:action sip
    :parameters (?x ?y ?z - obj)
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

  ;; clip: like sip but requires sneeze on Y and consumes next(X,Z) while observing next(Y,Z)
  (:action clip
    :parameters (?x ?y ?z - obj)
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

  ;; memory: relinks next(X,Y) -> next(X,Z) when X is a cat and Y,Z are springs
  (:action memory
    :parameters (?x ?y ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; paltry: consumes vase(X,Y) and, given next(Y,Z), creates next(X,Z)
  (:action paltry
    :parameters (?x ?y ?z - obj)
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

  ;; tightfisted: alternative consumer of vase that requires sneeze on the middle object
  (:action tightfisted
    :parameters (?x ?y ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; wretched: pointer-move using collect pairs to determine destination; removes old next and adds new next
  (:action wretched
    :parameters (?x ?y ?z ?w - obj)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )
)