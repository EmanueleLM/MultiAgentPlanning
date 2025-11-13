(define (domain hanoi-multiagent)
  (:requirements :strips :typing)
  (:types
    agent support
    disk peg - support
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?y - support)
    (smaller ?x - disk ?y - disk)
    (assigned ?a - agent ?x - disk)
  )

  (:action move-p2p
    :parameters (?ag - agent ?x - disk ?from - peg ?to - peg)
    :precondition (and
      (assigned ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action move-p2d
    :parameters (?ag - agent ?x - disk ?from - peg ?to - disk)
    :precondition (and
      (assigned ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action move-d2p
    :parameters (?ag - agent ?x - disk ?from - disk ?to - peg)
    :precondition (and
      (assigned ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action move-d2d
    :parameters (?ag - agent ?x - disk ?from - disk ?to - disk)
    :precondition (and
      (assigned ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )
)