(define (domain hanoi_agents_2a_15d)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (on-peg ?d - disk ?p - peg) ; provided for completeness; not used by operators
    (clear ?p - place)
    (smaller ?d - disk ?p - place)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
  )

  (:action move_by_agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (can-move-agent1 ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
    )
  )

  (:action move_by_agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (can-move-agent2 ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
    )
  )
)