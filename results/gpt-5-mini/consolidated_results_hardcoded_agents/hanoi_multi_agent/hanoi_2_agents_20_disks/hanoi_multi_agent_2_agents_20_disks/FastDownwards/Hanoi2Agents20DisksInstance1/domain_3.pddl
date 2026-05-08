(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent - object)
  (:constants agent_1 agent_2 - agent)

  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?ag - agent ?d - disk)
  )

  (:action move-agent_1-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
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
      (clear ?d)
    )
  )

  (:action move-agent_1-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
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
      (clear ?d)
    )
  )

  (:action move-agent_1-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
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
      (clear ?d)
    )
  )

  (:action move-agent_1-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
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
      (clear ?d)
    )
  )

  (:action move-agent_2-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
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
      (clear ?d)
    )
  )

  (:action move-agent_2-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
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
      (clear ?d)
    )
  )

  (:action move-agent_2-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
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
      (clear ?d)
    )
  )

  (:action move-agent_2-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
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
      (clear ?d)
    )
  )
)