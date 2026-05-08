(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?x - disk ?y - (either disk peg))
    (clear ?x - (either disk peg))
    (empty ?p - peg)
    (larger ?x - disk ?y - disk)
  )

  (:action move_agent_1_A_left_right
    :parameters ()
    :precondition (and (on A B) (clear A) (empty right))
    :effect (and
      (not (on A B))
      (on A right)
      (not (empty right))
      (clear B)
    )
  )

  (:action move_agent_1_B_left_middle
    :parameters ()
    :precondition (and (on B C) (clear B) (empty middle))
    :effect (and
      (not (on B C))
      (on B middle)
      (not (empty middle))
      (clear C)
    )
  )

  (:action move_agent_1_A_right_middle
    :parameters ()
    :precondition (and (on A right) (clear A) (on B middle) (clear B) (larger B A))
    :effect (and
      (not (on A right))
      (on A B)
      (not (clear B))
      (empty right)
    )
  )

  (:action move_agent_1_C_left_right
    :parameters ()
    :precondition (and (on C D) (clear C) (empty right))
    :effect (and
      (not (on C D))
      (on C right)
      (not (empty right))
      (clear D)
    )
  )

  (:action move_agent_1_A_middle_right
    :parameters ()
    :precondition (and (on A B) (clear A) (on C right) (clear C) (larger C A))
    :effect (and
      (not (on A B))
      (on A C)
      (clear B)
      (not (clear C))
    )
  )

  (:action move_agent_1_B_middle_left
    :parameters ()
    :precondition (and (on B middle) (clear B) (on D left) (clear D) (larger D B))
    :effect (and
      (not (on B middle))
      (on B D)
      (not (clear D))
      (empty middle)
      (clear middle)
    )
  )
)