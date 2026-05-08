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
    ;; vase is ternary to carry the Z that tied the two next facts together at creation time:
    (vase ?x ?y ?z - obj)
  )

  ;; sip: produces a transfer-token (vase X Y Z) by consuming next(X,Z) while observing next(Y,Z)
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
      (vase ?x ?y ?z)
      (not (next ?x ?z))
    )
  )

  ;; clip: like sip but requires sneeze on the second participant
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
      (vase ?x ?y ?z)
      (not (next ?x ?z))
    )
  )

  ;; memory: re-link next(?x,?y) -> next(?x,?z) (removes the old next and adds the new)
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

  ;; paltry: consumes a transfer-token (vase with the same Z) and completes the transfer by adding next(X,Z)
  (:action paltry
    :parameters (?x ?y ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y ?z)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y ?z))
    )
  )

  ;; tightfisted: alternative consumer of the transfer-token that requires sneeze on the middle object
  (:action tightfisted
    :parameters (?x ?y ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y ?z))
    )
  )

  ;; wretched: another pointer-move that uses collect facts to determine destination; removes old next and adds new
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