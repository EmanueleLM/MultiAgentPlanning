(define (domain hanoi-three-agents)
  (:requirements :typing :negative-preconditions)
  (:types disk peg - place agent)
  (:constants agent_1 agent_2 agent_3 - agent
              A B C D E F G H I J - disk
              left middle right - peg)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
  )

  (:action agent_1_move_A_left_right
    :parameters ()
    :precondition (and
      (allowed agent_1 A)
      (on A B)
      (clear A)
      (empty right)
    )
    :effect (and
      (not (on A B))
      (on A right)
      (clear B)
      (not (empty right))
      (clear A)
    )
  )

  (:action agent_1_move_B_left_middle
    :parameters ()
    :precondition (and
      (allowed agent_1 B)
      (on B C)
      (clear B)
      (empty middle)
    )
    :effect (and
      (not (on B C))
      (on B middle)
      (clear C)
      (not (empty middle))
      (clear B)
    )
  )

  (:action agent_1_move_A_right_middle
    :parameters ()
    :precondition (and
      (allowed agent_1 A)
      (on A right)
      (clear A)
      (on B middle)
      (clear B)
      (smaller A B)
    )
    :effect (and
      (not (on A right))
      (on A B)
      (not (clear B))
      (empty right)
      (clear A)
    )
  )

  (:action agent_1_move_C_left_right
    :parameters ()
    :precondition (and
      (allowed agent_1 C)
      (on C D)
      (clear C)
      (empty right)
    )
    :effect (and
      (not (on C D))
      (on C right)
      (clear D)
      (not (empty right))
      (clear C)
    )
  )

  (:action agent_1_move_A_middle_right
    :parameters ()
    :precondition (and
      (allowed agent_1 A)
      (on A B)
      (clear A)
      (on C right)
      (clear C)
      (smaller A C)
    )
    :effect (and
      (not (on A B))
      (on A C)
      (clear B)
      (not (clear C))
      (clear A)
    )
  )

  (:action agent_1_move_B_middle_left
    :parameters ()
    :precondition (and
      (allowed agent_1 B)
      (on B middle)
      (clear B)
      (on D E)
      (smaller B D)
    )
    :effect (and
      (not (on B middle))
      (on B D)
      (empty middle)
      (not (clear D))
      (clear B)
    )
  )
)