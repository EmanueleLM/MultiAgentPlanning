(define (domain hanoi-coop)
  (:requirements :strips :typing)
  (:types
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (belongs_agent1 ?d - disk)
    (belongs_agent2 ?d - disk)
    (is-peg ?p - peg)
    ; Static legality helper to stay within STRIPS without disjunction:
    ; placeable(d,s) holds iff s is a peg OR s is a larger disk than d.
    (placeable ?d - disk ?s - support)
  )

  (:action move_agent_1
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (belongs_agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (placeable ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_2
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (belongs_agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (placeable ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to))
      (clear ?from)
      (not (clear ?to))
    )
  )
)