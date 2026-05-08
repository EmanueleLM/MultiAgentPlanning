(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a ?b - obj)
    (next ?a ?b - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?a ?b - obj)
    (spring ?o - obj)
    (cleared-next ?o - obj)
  )

  ;; paltry: requires the subject has no current next (cleared-next),
  ;; uses an existing vase(A,B) and next(B,C), creates next(A,C) and removes vase(A,B).
  (:action orchestrator-paltry
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (cleared-next ?a)
      (not (= ?a ?b))
      (not (= ?a ?c))
      (not (= ?b ?c))
    )
    :effect (and
      (not (vase ?a ?b))
      (next ?a ?c)
      (not (cleared-next ?a))
    )
  )

  ;; sip: requires next(A,C) and next(B,C); creates vase(A,B) and clears A's next
  (:action orchestrator-sip
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (not (= ?a ?b))
      (not (= ?a ?c))
      (not (= ?b ?c))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (cleared-next ?a)
    )
  )

  ;; clip: requires both subject and sneeze point to same texture C; creates vase(A,B) and clears A's next
  (:action orchestrator-clip
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (not (= ?a ?b))
      (not (= ?a ?c))
      (not (= ?b ?c))
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (cleared-next ?a)
    )
  )

  ;; wretched: swaps next(A,B) -> next(A,C) when B and C are textures collected into the same stupendous D
  ;; This action replaces the existing next for the sneeze subject atomically.
  (:action orchestrator-wretched
    :parameters (?a ?b ?c ?d - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (not (= ?b ?c))
    )
    :effect (and
      (not (next ?a ?b))
      (next ?a ?c)
    )
  )

  ;; memory: swaps next(A,B) -> next(A,C) for cats A between springs B and C
  (:action orchestrator-memory
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (not (= ?b ?c))
    )
    :effect (and
      (not (next ?a ?b))
      (next ?a ?c)
    )
  )

  ;; tightfisted: requires vase(A,B) and next(B,C) and that A currently has no next (cleared),
  ;; then creates next(A,C) and deletes the vase relation.
  (:action orchestrator-tightfisted
    :parameters (?a ?b ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (cleared-next ?a)
      (not (= ?a ?b))
      (not (= ?a ?c))
      (not (= ?b ?c))
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (cleared-next ?a))
    )
  )

)