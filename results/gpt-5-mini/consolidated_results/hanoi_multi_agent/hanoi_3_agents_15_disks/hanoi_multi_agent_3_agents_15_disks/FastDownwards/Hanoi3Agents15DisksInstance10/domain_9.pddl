(define (domain multiagent-hanoi-3agents)
  (:requirements :typing :negative-preconditions)
  (:types disk peg agent)

  (:constants agent_1 agent_2 agent_3 orchestrator - agent)

  (:predicates
    (on ?d - disk ?p - (either disk peg))
    (clear ?p - (either disk peg))
    (canmove ?a - agent ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (canmove agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (canmove agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (canmove agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (canmove agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent3-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (canmove agent_3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent3-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (canmove agent_3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
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