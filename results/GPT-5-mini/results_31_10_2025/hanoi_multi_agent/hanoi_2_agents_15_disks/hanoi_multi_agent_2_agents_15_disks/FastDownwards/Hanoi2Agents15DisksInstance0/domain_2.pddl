(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent place disk - place)

  (:constants agent_1 agent_2 orchestrator - agent)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (can-move ?a - agent ?d - disk)
    (smaller ?d - disk ?p - place)
  )

  (:action move-agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_1 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_2 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)