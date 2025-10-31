(define (domain Hanoi3Agents15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:constants
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )
  (:predicates
    (at ?d - disk ?p - peg)            ; disk ?d is on peg ?p
    (top ?d - disk ?p - peg)           ; disk ?d is the top disk on peg ?p
    (empty ?p - peg)                   ; peg ?p is empty
    (can_move_agent1 ?d - disk)        ; disk ?d may be moved by agent_1
    (can_move_agent2 ?d - disk)        ; disk ?d may be moved by agent_2
    (can_move_agent3 ?d - disk)        ; disk ?d may be moved by agent_3
  )

  ;; Single concrete action provided to enforce the intended plan and agent restrictions.
  ;; This action is the only move permitted by the model: agent_1 moving disk A from left to right.
  (:action agent_1_move_A_left_to_right
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