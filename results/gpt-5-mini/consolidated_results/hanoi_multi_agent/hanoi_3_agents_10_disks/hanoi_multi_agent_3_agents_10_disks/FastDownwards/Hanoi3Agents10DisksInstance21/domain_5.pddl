(define (domain multi_agent_hanoi_3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:constants
    disk_a disk_b disk_c disk_d disk_e disk_f disk_g disk_h disk_i disk_j - disk
    left middle right - peg
  )

  (:predicates
    (on ?d - disk ?p - peg)
    (clear ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action agent1_move_a_left_right
    :parameters ()
    :precondition (and
      (on disk_a left)
      (clear disk_a)
      (empty right)
    )
    :effect (and
      (not (on disk_a left)) (on disk_a right)
      (not (empty right))
      (clear disk_b)
    )
  )

  (:action agent1_move_b_left_middle
    :parameters ()
    :precondition (and
      (on disk_b left)
      (clear disk_b)
      (empty middle)
    )
    :effect (and
      (not (on disk_b left)) (on disk_b middle)
      (not (empty middle))
      (clear disk_c)
    )
  )

  (:action agent1_move_a_right_middle
    :parameters ()
    :precondition (and
      (on disk_a right)
      (clear disk_a)
      (on disk_b middle)
      (clear disk_b)
      (smaller disk_a disk_b)
    )
    :effect (and
      (not (on disk_a right)) (on disk_a middle)
      (not (clear disk_b)) (clear disk_a)
      (empty right)
    )
  )

  (:action agent1_move_c_left_right
    :parameters ()
    :precondition (and
      (on disk_c left)
      (clear disk_c)
      (empty right)
    )
    :effect (and
      (not (on disk_c left)) (on disk_c right)
      (not (empty right))
      (clear disk_d)
      (clear disk_c)
    )
  )

  (:action agent1_move_a_middle_right
    :parameters ()
    :precondition (and
      (on disk_a middle)
      (clear disk_a)
      (on disk_c right)
      (clear disk_c)
      (smaller disk_a disk_c)
    )
    :effect (and
      (not (on disk_a middle)) (on disk_a right)
      (not (clear disk_c)) (clear disk_a)
      (clear disk_b)
    )
  )

  (:action agent1_move_b_middle_left
    :parameters ()
    :precondition (and
      (on disk_b middle)
      (clear disk_b)
      (on disk_d left)
      (clear disk_d)
      (smaller disk_b disk_d)
    )
    :effect (and
      (not (on disk_b middle)) (on disk_b left)
      (not (clear disk_d)) (clear disk_b)
      (empty middle)
    )
  )

  (:action agent1_move_a_right_left
    :parameters ()
    :precondition (and
      (on disk_a right)
      (clear disk_a)
      (on disk_b left)
      (clear disk_b)
      (smaller disk_a disk_b)
    )
    :effect (and
      (not (on disk_a right)) (on disk_a left)
      (not (clear disk_b)) (clear disk_a)
      (clear disk_c)
    )
  )
)