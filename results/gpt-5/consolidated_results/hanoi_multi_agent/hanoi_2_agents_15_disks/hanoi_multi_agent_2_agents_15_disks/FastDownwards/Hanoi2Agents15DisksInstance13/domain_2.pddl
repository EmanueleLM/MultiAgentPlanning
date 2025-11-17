(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    place
    disk peg - place
  )
  (:constants
    agent_1 agent_2 - agent
  )
  (:predicates
    (on ?d - disk ?s - place)
    (clear ?s - place)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-agent_1-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move agent_1 ?d)
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

  (:action move-agent_1-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move agent_1 ?d)
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

  (:action move-agent_2-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move agent_2 ?d)
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

  (:action move-agent_2-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move agent_2 ?d)
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