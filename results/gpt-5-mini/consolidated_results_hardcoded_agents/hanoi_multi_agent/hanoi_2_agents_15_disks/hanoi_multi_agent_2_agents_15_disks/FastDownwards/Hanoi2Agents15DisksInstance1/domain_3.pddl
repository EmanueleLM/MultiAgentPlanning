(define (domain hanoi_2agents_fixed_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)
    (above ?d1 - disk ?d2 - disk)
    (clear ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (agent1 ?d - disk)
    (agent2 ?d - disk)
  )

  (:action agent1_move_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (agent1 ?d) (on ?d ?from) (clear ?d) (empty ?to))
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (not (empty ?to))
      (clear ?d)
    )
  )

  (:action agent1_move_onto
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and (agent1 ?d) (on ?d ?from) (clear ?d) (on ?d2 ?to) (clear ?d2) (smaller ?d ?d2))
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (not (clear ?d2))
      (above ?d ?d2)
      (clear ?d)
    )
  )

  (:action agent2_move_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (agent2 ?d) (on ?d ?from) (clear ?d) (empty ?to))
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (not (empty ?to))
      (clear ?d)
    )
  )

  (:action agent2_move_onto
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and (agent2 ?d) (on ?d ?from) (clear ?d) (on ?d2 ?to) (clear ?d2) (smaller ?d ?d2))
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (not (clear ?d2))
      (above ?d ?d2)
      (clear ?d)
    )
  )
)