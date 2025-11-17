(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (can_move_agent_1 ?d - disk)
    (can_move_agent_2 ?d - disk)
    (can_be_placed_on ?d - disk ?p - place)
  )

  (:action move_agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_agent_1 ?d)
      (can_be_placed_on ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move_agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_agent_2 ?d)
      (can_be_placed_on ?d ?to)
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