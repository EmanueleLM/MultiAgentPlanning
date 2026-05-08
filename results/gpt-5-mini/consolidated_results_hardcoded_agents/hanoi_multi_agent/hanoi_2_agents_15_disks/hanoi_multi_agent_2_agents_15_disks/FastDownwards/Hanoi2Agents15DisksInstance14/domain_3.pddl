(define (domain hanoi_multi_agent_exact)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - pos)
  (:constants
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
  )
  (:predicates
    (on ?d - disk ?x - pos)
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action agent_1_move_01_A_left_right
    :parameters ()
    :precondition (and
      (top left a)
      (empty right)
      (on a b)
    )
    :effect (and
      (not (top left a))
      (top left b)
      (not (empty right))
      (top right a)
      (not (on a b))
      (on a right)
    )
  )

  (:action agent_1_move_02_B_left_middle
    :parameters ()
    :precondition (and
      (top left b)
      (empty middle)
      (on b c)
    )
    :effect (and
      (not (top left b))
      (top left c)
      (not (empty middle))
      (top middle b)
      (not (on b c))
      (on b middle)
    )
  )

  (:action agent_1_move_03_A_right_middle
    :parameters ()
    :precondition (and
      (top right a)
      (top middle b)
      (on a right)
      (on b middle)
      (smaller a b)
    )
    :effect (and
      (not (top right a))
      (not (top middle b))
      (top middle a)
      (not (on a right))
      (on a b)
      (empty right)
    )
  )

  (:action agent_1_move_04_C_left_right
    :parameters ()
    :precondition (and
      (top left c)
      (empty right)
      (on c d)
    )
    :effect (and
      (not (top left c))
      (top left d)
      (not (empty right))
      (top right c)
      (not (on c d))
      (on c right)
    )
  )

  (:action agent_1_move_05_A_middle_left
    :parameters ()
    :precondition (and
      (top middle a)
      (top left d)
      (on a b)
    )
    :effect (and
      (not (top middle a))
      (top middle b)
      (not (top left d))
      (top left a)
      (not (on a b))
      (on a d)
    )
  )

  (:action agent_1_move_06_B_middle_right
    :parameters ()
    :precondition (and
      (top middle b)
      (top right c)
      (on b middle)
      (on c right)
      (smaller b c)
    )
    :effect (and
      (not (top middle b))
      (top right b)
      (not (top right c))
      (not (on b middle))
      (on b c)
      (empty middle)
    )
  )

  (:action agent_1_move_07_A_left_right
    :parameters ()
    :precondition (and
      (top left a)
      (top right b)
      (on a d)
      (on b c)
      (smaller a b)
    )
    :effect (and
      (not (top left a))
      (top left d)
      (not (top right b))
      (top right a)
      (not (on a d))
      (on a b)
    )
  )

  (:action agent_1_move_08_D_left_middle
    :parameters ()
    :precondition (and
      (top left d)
      (empty middle)
      (on d e)
    )
    :effect (and
      (not (top left d))
      (top left e)
      (not (empty middle))
      (top middle d)
      (not (on d e))
      (on d middle)
    )
  )

  (:action agent_1_move_09_A_right_middle
    :parameters ()
    :precondition (and
      (top right a)
      (top middle d)
      (on a b)
      (on d middle)
      (smaller a d)
    )
    :effect (and
      (not (top right a))
      (not (top middle d))
      (top middle a)
      (not (on a b))
      (on a d)
      (empty right)
    )
  )

  (:action agent_1_move_10_B_right_left
    :parameters ()
    :precondition (and
      (top right b)
      (top left e)
      (on b c)
    )
    :effect (and
      (not (top right b))
      (top right c)
      (not (top left e))
      (top left b)
      (not (on b c))
      (on b e)
    )
  )

  (:action agent_1_move_11_A_middle_left
    :parameters ()
    :precondition (and
      (top middle a)
      (top left b)
      (on a d)
      (on b e)
    )
    :effect (and
      (not (top middle a))
      (top middle d)
      (not (top left b))
      (top left a)
      (not (on a d))
      (on a b)
    )
  )

  (:action agent_1_move_12_C_right_middle
    :parameters ()
    :precondition (and
      (top right c)
      (top middle d)
      (on c right)
      (on d middle)
      (smaller c d)
    )
    :effect (and
      (not (top right c))
      (not (top middle d))
      (top middle c)
      (not (on c right))
      (on c d)
      (empty right)
    )
  )

  (:action agent_1_move_13_A_left_right
    :parameters ()
    :precondition (and
      (top left a)
      (empty right)
      (on a b)
    )
    :effect (and
      (not (top left a))
      (top left b)
      (not (empty right))
      (top right a)
      (not (on a b))
      (on a right)
    )
  )

  (:action agent_1_move_14_B_left_middle
    :parameters ()
    :precondition (and
      (top left b)
      (top middle c)
      (on b e)
      (on c d)
      (smaller b c)
    )
    :effect (and
      (not (top left b))
      (top left e)
      (not (top middle c))
      (top middle b)
      (not (on b e))
      (on b c)
    )
  )

  (:action agent_1_move_15_A_right_middle
    :parameters ()
    :precondition (and
      (top right a)
      (top middle b)
      (on a right)
      (on b c)
      (smaller a b)
    )
    :effect (and
      (not (top right a))
      (not (top middle b))
      (top middle a)
      (not (on a right))
      (on a b)
      (empty right)
    )
  )

  (:action agent_1_move_16_A_middle_left
    :parameters ()
    :precondition (and
      (top middle a)
      (top left e)
      (on a b)
    )
    :effect (and
      (not (top middle a))
      (top middle b)
      (not (top left e))
      (top left a)
      (not (on a b))
      (on a e)
    )
  )

  (:action agent_1_move_17_B_middle_right
    :parameters ()
    :precondition (and
      (top middle b)
      (empty right)
      (on b c)
    )
    :effect (and
      (not (top middle b))
      (top middle c)
      (not (empty right))
      (top right b)
      (not (on b c))
      (on b right)
    )
  )

  (:action agent_1_move_18_A_left_right
    :parameters ()
    :precondition (and
      (top left a)
      (top right b)
      (on a e)
      (on b right)
      (smaller a b)
    )
    :effect (and
      (not (top left a))
      (top left e)
      (not (top right b))
      (top right a)
      (not (on a e))
      (on a b)
    )
  )

  (:action agent_1_move_19_C_middle_left
    :parameters ()
    :precondition (and
      (top middle c)
      (top left e)
      (on c d)
    )
    :effect (and
      (not (top middle c))
      (top middle d)
      (not (top left e))
      (top left c)
      (not (on c d))
      (on c e)
    )
  )

  (:action agent_1_move_20_A_right_middle
    :parameters ()
    :precondition (and
      (top right a)
      (top middle d)
      (on a b)
      (on d middle)
      (smaller a d)
    )
    :effect (and
      (not (top right a))
      (not (top middle d))
      (top middle a)
      (not (on a b))
      (on a d)
      (empty right)
    )
  )
)