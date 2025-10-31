(define (domain hanoi3agents20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:constants A B C D E F G H I J K L M N O P Q R S T - disk
              left middle right - peg)
  (:predicates
    (on ?d - disk ?p - peg)
  )

  (:action agent_1_move_A_left_middle
    :parameters ()
    :precondition (and
      (on A left)
    )
    :effect (and
      (not (on A left))
      (on A middle)
    )
  )

  (:action agent_1_move_B_left_right
    :parameters ()
    :precondition (and
      (on B left)
      (not (on A left))
      (not (on A right))
    )
    :effect (and
      (not (on B left))
      (on B right)
    )
  )

  (:action agent_1_move_A_middle_right
    :parameters ()
    :precondition (and
      (on A middle)
    )
    :effect (and
      (not (on A middle))
      (on A right)
    )
  )

  (:action agent_1_move_C_left_middle
    :parameters ()
    :precondition (and
      (on C left)
      (not (on A left))
      (not (on B left))
      (not (on A middle))
      (not (on B middle))
    )
    :effect (and
      (not (on C left))
      (on C middle)
    )
  )

  (:action agent_1_move_A_right_middle
    :parameters ()
    :precondition (and
      (on A right)
    )
    :effect (and
      (not (on A right))
      (on A middle)
    )
  )

  (:action agent_1_move_B_right_left
    :parameters ()
    :precondition (and
      (on B right)
      (not (on A right))
      (not (on A left))
    )
    :effect (and
      (not (on B right))
      (on B left)
    )
  )
)