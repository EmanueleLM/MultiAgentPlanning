(define (domain hanoi-agents)
  (:requirements :strips :typing)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (controls ?a - agent ?d - disk)
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
  )

  (:action move-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (controls ?ag ?d)
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

  (:action move-disk-to-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (controls ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)