(define (domain hanoi-3agents-10disks)
  (:requirements :strips :typing)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?z - support)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (clear ?p)
      (on ?d ?from)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - support ?dest - disk)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (clear ?dest)
      (smaller ?d ?dest)
      (on ?d ?from)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dest)
      (clear ?from)
      (not (clear ?dest))
    )
  )
)