(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)
  (:constants agent_1 agent_2 - agent)
  (:predicates
    (on ?d - disk ?p - (either disk peg))
    (clear ?x - (either disk peg))
    (can-place ?d - disk ?p - (either disk peg))
    (allowed ?a - agent ?d - disk)
  )

  (:action move_agent_1
    :parameters (?d - disk ?from - (either disk peg) ?to - (either disk peg))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_2
    :parameters (?d - disk ?from - (either disk peg) ?to - (either disk peg))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)