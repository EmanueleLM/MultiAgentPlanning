(define (domain Hanoi3Agents15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (at ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
  )

  (:action agent_1_move_A_left_to_right
    :parameters ()
    :precondition (and
      (can_move_agent1 A)
      (at A left)
      (top A left)
      (empty right)
    )
    :effect (and
      (not (at A left))
      (at A right)
      (not (top A left))
      (top A right)
      (not (empty right))
    )
  )
)