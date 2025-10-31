(define (domain multi-agent-hanoi)
  (:requirements :typing :negative-preconditions)
  (:types
    agent place
    agent1 agent2 agent3 orchestrator - agent
    disk peg - place
  )

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?x - disk ?y - place)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-agent_1
    :parameters (?a - agent1 ?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-agent_2
    :parameters (?a - agent2 ?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-agent_3
    :parameters (?a - agent3 ?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)