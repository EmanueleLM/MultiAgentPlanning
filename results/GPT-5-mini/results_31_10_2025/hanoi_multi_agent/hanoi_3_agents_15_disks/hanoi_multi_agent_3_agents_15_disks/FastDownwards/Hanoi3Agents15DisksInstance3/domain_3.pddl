(define (domain hanoi3agents15)
  (:requirements :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (at ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
  )

  (:action agent1-move-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent1 ?d)
      (at ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (at ?d ?from))
      (at ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  (:action agent2-move-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent2 ?d)
      (at ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (at ?d ?from))
      (at ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  (:action agent3-move-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move_agent3 ?d)
      (at ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (at ?d ?from))
      (at ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
    )
  )
)