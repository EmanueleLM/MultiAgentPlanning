(define (domain hanoi_3agents_20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (below ?u - disk ?l - disk)
    (smaller ?x - disk ?y - disk)
  )

  (:action agent_1_move_a_left_right
    :parameters ()
    :precondition (and
      (on a left)
      (top a left)
      (empty right)
    )
    :effect (and
      (not (on a left))
      (on a right)
      (not (top a left))
      (top a right)
      (not (below a b))
      (top b left)
      (not (empty right))
    )
  )

  (:action agent_1_move_b_left_middle
    :parameters ()
    :precondition (and
      (on b left)
      (top b left)
      (empty middle)
    )
    :effect (and
      (not (on b left))
      (on b middle)
      (not (top b left))
      (top b middle)
      (not (below b c))
      (top c left)
      (not (empty middle))
    )
  )

  (:action agent_1_move_a_right_middle
    :parameters ()
    :precondition (and
      (on a right)
      (top a right)
      (on b middle)
      (top b middle)
      (smaller a b)
    )
    :effect (and
      (not (on a right))
      (on a middle)
      (not (top a right))
      (top a middle)
      (below a b)
      (not (top b middle))
      (empty right)
    )
  )

  (:action agent_1_move_c_left_right
    :parameters ()
    :precondition (and
      (on c left)
      (top c left)
      (empty right)
    )
    :effect (and
      (not (on c left))
      (on c right)
      (not (top c left))
      (top c right)
      (not (below c d))
      (top d left)
      (not (empty right))
    )
  )

  (:action agent_1_move_a_middle_left
    :parameters ()
    :precondition (and
      (on a middle)
      (top a middle)
      (on d left)
      (top d left)
      (smaller a d)
    )
    :effect (and
      (not (on a middle))
      (on a left)
      (not (top a middle))
      (top a left)
      (below a d)
      (not (below a b))
      (top b middle)
    )
  )

  (:action agent_1_move_b_middle_right
    :parameters ()
    :precondition (and
      (on b middle)
      (top b middle)
      (on c right)
      (top c right)
      (smaller b c)
    )
    :effect (and
      (not (on b middle))
      (on b right)
      (not (top b middle))
      (top b right)
      (below b c)
      (empty middle)
      (not (top c right))
    )
  )

  (:action agent_1_move_a_left_middle
    :parameters ()
    :precondition (and
      (on a left)
      (top a left)
      (empty middle)
    )
    :effect (and
      (not (on a left))
      (on a middle)
      (not (top a left))
      (top a middle)
      (not (below a d))
      (top d left)
      (not (empty middle))
    )
  )
)