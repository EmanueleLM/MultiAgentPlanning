(define (domain hanoi-3agent-10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg disk - support
    agent
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?ag - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?p - peg)
    :precondition (and
      (can-move ?ag ?d)
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

  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - support ?u - disk)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?u)
      (smaller ?d ?u)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?u)
      (clear ?from)
      (not (clear ?u))
    )
  )
)