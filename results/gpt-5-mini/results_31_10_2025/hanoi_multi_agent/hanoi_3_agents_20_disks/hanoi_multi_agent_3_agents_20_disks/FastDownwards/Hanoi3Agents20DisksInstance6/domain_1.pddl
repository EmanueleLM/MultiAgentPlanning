(define (domain hanoi3agents20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?p - peg)
  )

  ;; Actions are annotated with the agent performing them and are written
  ;; specifically for the moves in the proposed solution. Negative preconditions
  ;; enumerate smaller disks to ensure a disk is top on its source peg and that
  ;; no smaller disk sits on the destination peg (legal Tower of Hanoi rule).
  ;; Only agent_1 actions are provided because only agent_1 moves in the plan.
  (:action agent_1_move_A_left_middle
    :precondition (on A left)
    :effect (and
      (not (on A left))
      (on A middle)
    )
  )

  (:action agent_1_move_B_left_right
    :precondition (and
      (on B left)
      ;; A is smaller than B, must not be on the source (left)
      (not (on A left))
      ;; A must not be on the destination (right) (cannot place B on A)
      (not (on A right))
    )
    :effect (and
      (not (on B left))
      (on B right)
    )
  )

  (:action agent_1_move_A_middle_right
    :precondition (on A middle)
    :effect (and
      (not (on A middle))
      (on A right)
    )
  )

  (:action agent_1_move_C_left_middle
    :precondition (and
      (on C left)
      ;; A and B are smaller than C; they must not be on source (left)
      (not (on A left))
      (not (on B left))
      ;; A and B must not be on destination (middle) (cannot place C on smaller)
      (not (on A middle))
      (not (on B middle))
    )
    :effect (and
      (not (on C left))
      (on C middle)
    )
  )

  (:action agent_1_move_A_right_middle
    :precondition (on A right)
    :effect (and
      (not (on A right))
      (on A middle)
    )
  )

  (:action agent_1_move_B_right_left
    :precondition (and
      (on B right)
      ;; A is smaller than B and must not be on source (right)
      (not (on A right))
      ;; A must not be on destination (left) (cannot place B on A)
      (not (on A left))
    )
    :effect (and
      (not (on B right))
      (on B left)
    )
  )
)