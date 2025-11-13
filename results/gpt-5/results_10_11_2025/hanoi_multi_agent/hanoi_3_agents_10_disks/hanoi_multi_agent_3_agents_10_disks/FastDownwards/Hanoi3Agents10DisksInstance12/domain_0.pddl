(define (domain hanoi-three-agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    disk - support
    peg - support
    agent
  )

  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (on ?d ?p)
      (clear ?from)
      (not (on ?d ?from))
      (not (clear ?p))
      (not (clear ?d))
    )
  )

  (:action move-disk-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (on ?d ?t)
      (clear ?from)
      (not (on ?d ?from))
      (not (clear ?t))
      (not (clear ?d))
    )
  )
)