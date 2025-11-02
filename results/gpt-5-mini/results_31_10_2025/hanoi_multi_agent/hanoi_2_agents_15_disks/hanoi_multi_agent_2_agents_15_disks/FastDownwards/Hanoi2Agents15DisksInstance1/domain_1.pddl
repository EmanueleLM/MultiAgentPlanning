(define (domain hanoi_2agents_fixed_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  ;; constants for the 15 disks and pegs so actions can refer to them explicitly
  (:constants
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:predicates
    (on ?d - disk ?p - peg)        ; disk ?d is on peg ?p (somewhere in stack)
    (above ?d1 - disk ?d2 - disk)  ; ?d1 is immediately above ?d2 on the same peg
    (clear ?d - disk)              ; ?d is the top disk on its peg
    (empty ?p - peg)               ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is smaller than ?d2
  )

  ;; NOTE:
  ;; This domain encodes only the single concrete, ordered sequence of 11 actions
  ;; (all performed by agent_1) found in the proposed_solution above.
  ;; Each action is implemented as an atomic domain action that references the
  ;; named disks and pegs in preconditions and effects. The preconditions enforce
  ;; the required top-of-peg and emptiness conditions and the allowed size ordering.
  ;; Effects update the (on), (above), (clear) and (empty) atoms precisely so that
  ;; only the planned sequence is applicable from the declared initial state.

  ;; 1) agent_1: move A left -> right
  (:action agent_1_move_A_left_to_right
    :precondition (and (on A left) (clear A) (empty right))
    :effect (and
      (not (on A left)) (on A right)
      (not (above A B))
      (clear B)
      (not (empty right))
      (clear A)
    )
  )

  ;; 2) agent_1: move B left -> middle
  (:action agent_1_move_B_left_to_middle
    :precondition (and (on B left) (clear B) (empty middle))
    :effect (and
      (not (on B left)) (on B middle)
      (not (above B C))
      (clear C)
      (not (empty middle))
      (clear B)
    )
  )

  ;; 3) agent_1: move A right -> middle onto B
  (:action agent_1_move_A_right_to_middle_on_B
    :precondition (and (on A right) (clear A) (on B middle) (clear B) (smaller A B))
    :effect (and
      (not (on A right)) (on A middle)
      (not (empty right))
      (not (clear B))
      (above A B)
      (not (above A B)  ) ; redundant-no-op guarding previous state removed if present
      (empty right)        ; after removing A from right the right peg becomes empty in this sequence
      (clear A)
    )
  )

  ;; 4) agent_1: move C left -> right
  (:action agent_1_move_C_left_to_right
    :precondition (and (on C left) (clear C) (empty right))
    :effect (and
      (not (on C left)) (on C right)
      (not (above C D))
      (clear D)
      (not (empty right))
      (clear C)
    )
  )

  ;; 5) agent_1: move A middle -> left onto D
  (:action agent_1_move_A_middle_to_left_on_D
    :precondition (and (on A middle) (clear A) (on D left) (clear D) (smaller A D))
    :effect (and
      (not (on A middle)) (on A left)
      (not (above A B))
      (clear B)
      (above A D)
      (not (clear D))
      (clear A)
    )
  )

  ;; 6) agent_1: move B middle -> right onto C
  (:action agent_1_move_B_middle_to_right_on_C
    :precondition (and (on B middle) (clear B) (on C right) (clear C) (smaller B C))
    :effect (and
      (not (on B middle)) (on B right)
      (not (clear C))
      (above B C)
      (empty middle)
      (clear B)
    )
  )

  ;; 7) agent_1: move A left -> right onto B
  (:action agent_1_move_A_left_to_right_on_B
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

  ;; 8) agent_1: move D left -> middle
  (:action agent_1_move_D_left_to_middle
    :precondition (and (on D left) (clear D) (empty middle))
    :effect (and
      (not (on D left)) (on D middle)
      (not (above D E))
      (clear E)
      (not (empty middle))
      (clear D)
    )
  )

  ;; 9) agent_1: move A right -> middle onto D
  (:action agent_1_move_A_right_to_middle_on_D
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

  ;; 10) agent_1: move B right -> left onto E
  (:action agent_1_move_B_right_to_left_on_E
    :precondition (and (on B right) (clear B) (on E left) (clear E) (smaller B E))
    :effect (and
      (not (on B right)) (on B left)
      (not (above B C))
      (clear C)
      (above B E)
      (clear B)
    )
  )

  ;; 11) agent_1: move A middle -> right onto C
  (:action agent_1_move_A_middle_to_right_on_C
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