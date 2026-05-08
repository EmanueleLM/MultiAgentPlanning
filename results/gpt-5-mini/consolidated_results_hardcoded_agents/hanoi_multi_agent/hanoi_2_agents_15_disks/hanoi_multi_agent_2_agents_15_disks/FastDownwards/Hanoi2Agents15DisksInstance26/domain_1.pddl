(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)
  (:predicates
    (on ?d - disk ?x - (either peg disk))
    (clear ?x - (either peg disk))
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  ;; Agent 1: move a top disk to an empty peg
  (:action move-to-peg-agent_1
    :parameters (?d - disk ?from - (either peg disk) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 1: move a top disk onto another disk (must be smaller than destination)
  (:action move-onto-disk-agent_1
    :parameters (?d - disk ?from - (either peg disk) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2: move a top disk to an empty peg
  (:action move-to-peg-agent_2
    :parameters (?d - disk ?from - (either peg disk) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2: move a top disk onto another disk (must be smaller than destination)
  (:action move-onto-disk-agent_2
    :parameters (?d - disk ?from - (either peg disk) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)