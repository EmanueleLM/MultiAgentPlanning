(define (domain multi-agent-hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)
    (clear ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action agent_1_move_a_left_right
    :parameters ()
    :precondition (and
      (on a left)
      (clear a)
      (empty right)
    )
    :effect (and
      (not (on a left)) (on a right)
      (not (empty right))
      (clear b)
    )
  )

  (:action agent_1_move_b_left_middle
    :parameters ()
    :precondition (and
      (on b left)
      (clear b)
      (empty middle)
    )
    :effect (and
      (not (on b left)) (on b middle)
      (not (empty middle))
      (clear c)
    )
  )

  (:action agent_1_move_a_right_middle
    :parameters ()
    :precondition (and
      (on a right)
      (clear a)
      (on b middle)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a right)) (on a middle)
      (not (clear b)) (clear a)
      (empty right)
    )
  )

  (:action agent_1_move_c_left_right
    :parameters ()
    :precondition (and
      (on c left)
      (clear c)
      (empty right)
    )
    :effect (and
      (not (on c left)) (on c right)
      (not (empty right))
      (clear d)
      (clear c)
    )
  )

  (:action agent_1_move_a_middle_right
    :parameters ()
    :precondition (and
      (on a middle)
      (clear a)
      (on c right)
      (clear c)
      (smaller a c)
    )
    :effect (and
      (not (on a middle)) (on a right)
      (not (clear c)) (clear a)
      (clear b)
    )
  )

  (:action agent_1_move_b_middle_left
    :parameters ()
    :precondition (and
      (on b middle)
      (clear b)
      (on d left)
      (clear d)
      (smaller b d)
    )
    :effect (and
      (not (on b middle)) (on b left)
      (not (clear d)) (clear b)
      (empty middle)
    )
  )

  (:action agent_1_move_a_right_left
    :parameters ()
    :precondition (and
      (on a right)
      (clear a)
      (on b left)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a right)) (on a left)
      (not (clear b)) (clear a)
      (clear c)
    )
  )
)