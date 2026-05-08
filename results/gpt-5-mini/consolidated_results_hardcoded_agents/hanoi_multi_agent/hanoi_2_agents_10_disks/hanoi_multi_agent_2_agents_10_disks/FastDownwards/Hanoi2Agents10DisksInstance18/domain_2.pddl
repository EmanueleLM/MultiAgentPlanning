(define (domain hanoi2agents10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
  )

  (:action move_agent_1_a_left_middle
    :parameters ()
    :precondition (and
      (can-move-agent1 a)
      (on a b)
      (clear a)
      (clear middle)
    )
    :effect (and
      (not (on a b))
      (on a middle)
      (not (clear middle))
      (clear b)
    )
  )

  (:action move_agent_1_b_left_right
    :parameters ()
    :precondition (and
      (can-move-agent1 b)
      (on b c)
      (clear b)
      (clear right)
    )
    :effect (and
      (not (on b c))
      (on b right)
      (not (clear right))
      (clear c)
    )
  )

  (:action move_agent_1_a_middle_right_place_on_b
    :parameters ()
    :precondition (and
      (can-move-agent1 a)
      (on a middle)
      (clear a)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a middle))
      (on a b)
      (not (clear b))
      (clear middle)
    )
  )

  (:action move_agent_1_c_left_middle
    :parameters ()
    :precondition (and
      (can-move-agent1 c)
      (on c d)
      (clear c)
      (clear middle)
    )
    :effect (and
      (not (on c d))
      (on c middle)
      (not (clear middle))
      (clear d)
    )
  )

  (:action move_agent_1_a_right_left_place_on_d
    :parameters ()
    :precondition (and
      (can-move-agent1 a)
      (on a b)
      (clear a)
      (clear d)
      (smaller a d)
    )
    :effect (and
      (not (on a b))
      (on a d)
      (not (clear d))
      (clear b)
    )
  )

  (:action move_agent_1_b_right_middle_place_on_c
    :parameters ()
    :precondition (and
      (can-move-agent1 b)
      (on b right)
      (clear b)
      (clear c)
      (smaller b c)
    )
    :effect (and
      (not (on b right))
      (on b c)
      (not (clear c))
      (clear right)
    )
  )

  (:action move_agent_1_a_left_middle_place_on_b
    :parameters ()
    :precondition (and
      (can-move-agent1 a)
      (on a d)
      (clear a)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a d))
      (on a b)
      (not (clear b))
      (clear d)
    )
  )

  (:action move_agent_1_d_left_right
    :parameters ()
    :precondition (and
      (can-move-agent1 d)
      (on d e)
      (clear d)
      (clear right)
    )
    :effect (and
      (not (on d e))
      (on d right)
      (not (clear right))
      (clear e)
    )
  )

  (:action move_agent_1_a_middle_right_place_on_d
    :parameters ()
    :precondition (and
      (can-move-agent1 a)
      (on a b)
      (clear a)
      (clear d)
      (smaller a d)
    )
    :effect (and
      (not (on a b))
      (on a d)
      (not (clear d))
      (clear b)
    )
  )

  (:action move_agent_1_b_middle_left_place_on_e
    :parameters ()
    :precondition (and
      (can-move-agent1 b)
      (on b c)
      (clear b)
      (clear e)
      (smaller b e)
    )
    :effect (and
      (not (on b c))
      (on b e)
      (not (clear e))
      (clear c)
    )
  )

  (:action move_agent_1_a_right_left_place_on_b
    :parameters ()
    :precondition (and
      (can-move-agent1 a)
      (on a d)
      (clear a)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a d))
      (on a b)
      (not (clear b))
      (clear d)
    )
  )

  (:action move_agent_1_c_middle_right_place_on_d
    :parameters ()
    :precondition (and
      (can-move-agent1 c)
      (on c middle)
      (clear c)
      (clear d)
      (smaller c d)
    )
    :effect (and
      (not (on c middle))
      (on c d)
      (not (clear d))
      (clear middle)
    )
  )

  (:action move_agent_1_a_left_right_place_on_c
    :parameters ()
    :precondition (and
      (can-move-agent1 a)
      (on a b)
      (clear a)
      (clear c)
      (smaller a c)
    )
    :effect (and
      (not (on a b))
      (on a c)
      (not (clear c))
      (clear b)
    )
  )

)