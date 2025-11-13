(define (domain hanoi-coop-2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (placeable ?d - disk ?s - support)
    (belongs_agent1 ?d - disk)
    (belongs_agent2 ?d - disk)
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
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)