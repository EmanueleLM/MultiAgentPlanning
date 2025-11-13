(define (domain hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (agent ?a - agent)
    (disk ?d - disk)
    (peg ?p - peg)
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controls ?a - agent ?d - disk)
    (can-put ?d - disk ?s - support)
  )

  (:action move
    :parameters (?ag - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (controls ?ag ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (can-put ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)