(define (domain hanoi_2agents_fixed_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)
    (above ?d1 - disk ?d2 - disk)
    (clear ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action agent_1_move_A_left_to_right
    :parameters ()
    :precondition (and (on A left) (clear A) (empty right))
    :effect (and
      (not (on A left)) (on A right)
      (not (above A B))
      (clear B)
      (not (empty right))
      (clear A)
    )
  )

  (:action agent_1_move_B_left_to_middle
    :parameters ()
    :precondition (and (on B left) (clear B) (empty middle))
    :effect (and
      (not (on B left)) (on B middle)
      (not (above B C))
      (clear C)
      (not (empty middle))
      (clear B)
    )
  )

  (:action agent_1_move_A_right_to_middle_on_B
    :parameters ()
    :precondition (and (on A right) (clear A) (on B middle) (clear B) (smaller A B))
    :effect (and
      (not (on A right)) (on A middle)
      (empty right)
      (not (clear B))
      (above A B)
      (clear A)
    )
  )

  (:action agent_1_move_C_left_to_right
    :parameters ()
    :precondition (and (on C left) (clear C) (empty right))
    :effect (and
      (not (on C left)) (on C right)
      (not (above C D))
      (clear D)
      (not (empty right))
      (clear C)
    )
  )

  (:action agent_1_move_A_middle_to_left_on_D
    :parameters ()
    :precondition (and (on A middle) (clear A) (on D left) (clear D) (smaller A D))
    :effect (and
      (not (on A middle)) (on A left)
      (not (above A B))
      (clear B)
      (not (clear D))
      (above A D)
      (clear A)
    )
  )

  (:action agent_1_move_B_middle_to_right_on_C
    :parameters ()
    :precondition (and (on B middle) (clear B) (on C right) (clear C) (smaller B C))
    :effect (and
      (not (on B middle)) (on B right)
      (not (clear C))
      (above B C)
      (empty middle)
      (clear B)
    )
  )

  (:action agent_1_move_A_left_to_right_on_B
    :parameters ()
    :precondition (and (on A left) (clear A) (on B right) (clear B) (smaller A B))
    :effect (and
      (not (on A left)) (on A right)
      (not (clear B))
      (above A B)
      (not (above A D))
      (clear D)
      (clear A)
    )
  )

  (:action agent_1_move_D_left_to_middle
    :parameters ()
    :precondition (and (on D left) (clear D) (empty middle))
    :effect (and
      (not (on D left)) (on D middle)
      (not (above D E))
      (clear E)
      (not (empty middle))
      (clear D)
    )
  )

  (:action agent_1_move_A_right_to_middle_on_D
    :parameters ()
    :precondition (and (on A right) (clear A) (on D middle) (clear D) (smaller A D))
    :effect (and
      (not (on A right)) (on A middle)
      (not (clear D))
      (above A D)
      (not (above A B))
      (clear B)
      (clear A)
    )
  )

  (:action agent_1_move_B_right_to_left_on_E
    :parameters ()
    :precondition (and (on B right) (clear B) (on E left) (clear E) (smaller B E))
    :effect (and
      (not (on B right)) (on B left)
      (not (above B C))
      (clear C)
      (above B E)
      (clear B)
    )
  )

  (:action agent_1_move_A_middle_to_right_on_C
    :parameters ()
    :precondition (and (on A middle) (clear A) (on C right) (clear C) (smaller A C))
    :effect (and
      (not (on A middle)) (on A right)
      (not (clear C))
      (above A C)
      (not (above A D))
      (clear D)
      (clear A)
    )
  )
)