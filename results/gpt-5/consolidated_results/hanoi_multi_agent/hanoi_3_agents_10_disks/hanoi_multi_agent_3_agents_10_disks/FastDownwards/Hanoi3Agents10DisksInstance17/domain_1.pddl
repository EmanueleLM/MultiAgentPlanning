(define (domain hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (canmove ?a - agent ?d - disk)
  )

  ; Move a disk onto an empty peg
  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg)
    :precondition (and
      (canmove ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
    )
  )

  ; Move a disk onto the top of another (larger) disk
  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?t - disk)
    :precondition (and
      (canmove ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
    )
  )
)