(define (domain hanoi-2agents-20-v2)
  (:requirements :strips :typing)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - support)
    (controls ?a - agent ?x - disk)
  )
  (:action move
    :parameters (?ag - agent ?x - disk ?from - support ?to - support)
    :precondition (and
      (controls ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)