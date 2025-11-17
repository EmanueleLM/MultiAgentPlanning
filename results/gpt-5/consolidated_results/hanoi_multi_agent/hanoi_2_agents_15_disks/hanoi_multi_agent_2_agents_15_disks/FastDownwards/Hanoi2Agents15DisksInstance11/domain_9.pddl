(define (domain hanoi-2agents-classical-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    step
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (curr ?t - step)
    (next ?t1 - step ?t2 - step)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg ?t - step ?t2 - step)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - support ?tgt - disk ?t - step ?t2 - step)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (clear ?from)
      (not (clear ?tgt))
      (not (curr ?t))
      (curr ?t2)
    )
  )
)