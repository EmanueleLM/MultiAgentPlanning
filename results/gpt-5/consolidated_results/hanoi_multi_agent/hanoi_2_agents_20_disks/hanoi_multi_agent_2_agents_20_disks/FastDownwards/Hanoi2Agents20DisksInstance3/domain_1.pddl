(define (domain hanoi2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (allowed ?a - agent ?d - disk)
  )

  ; Move a clear disk onto an empty peg
  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a clear disk onto a clear larger disk
  (:action move-onto-disk
    :parameters (?ag - agent ?d - disk ?from - support ?under - disk)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?under)
      (smaller ?d ?under)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?under)
      (clear ?from)
      (not (clear ?under))
    )
  )
)