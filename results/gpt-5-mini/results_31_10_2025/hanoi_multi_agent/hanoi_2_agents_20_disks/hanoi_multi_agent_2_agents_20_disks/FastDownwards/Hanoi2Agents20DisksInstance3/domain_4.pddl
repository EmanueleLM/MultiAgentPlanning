(define (domain hanoi-2agents-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)
    (step0)
    (step1)
    (step2)
    (step3)
    (step4)
    (step5)
    (step6)
    (step7)
    (step8)
    (step9)
    (step10)
    (can-agent1 ?d - disk)
    (can-agent2 ?d - disk)
  )

  (:action agent_1_move_a_left_middle
    :parameters ()
    :precondition (and (step0) (on a left) (can-agent1 a))
    :effect (and (not (on a left)) (on a middle) (not (step0)) (step1))
  )

  (:action agent_1_move_b_left_right
    :parameters ()
    :precondition (and (step1) (on b left) (not (on a left)) (not (on a right)) (can-agent1 b))
    :effect (and (not (on b left)) (on b right) (not (step1)) (step2))
  )

  (:action agent_1_move_a_middle_right
    :parameters ()
    :precondition (and (step2) (on a middle) (can-agent1 a))
    :effect (and (not (on a middle)) (on a right) (not (step2)) (step3))
  )

  (:action agent_1_move_c_left_middle
    :parameters ()
    :precondition (and (step3) (on c left) (not (on a left)) (not (on b left)) (not (on a middle)) (not (on b middle)) (can-agent1 c))
    :effect (and (not (on c left)) (on c middle) (not (step3)) (step4))
  )

  (:action agent_1_move_a_right_left
    :parameters ()
    :precondition (and (step4) (on a right) (can-agent1 a))
    :effect (and (not (on a right)) (on a left) (not (step4)) (step5))
  )

  (:action agent_1_move_b_right_middle
    :parameters ()
    :precondition (and (step5) (on b right) (not (on a right)) (not (on a middle)) (can-agent1 b))
    :effect (and (not (on b right)) (on b middle) (not (step5)) (step6))
  )

  (:action agent_1_move_a_left_middle_2
    :parameters ()
    :precondition (and (step6) (on a left) (not (on a middle)) (can-agent1 a))
    :effect (and (not (on a left)) (on a middle) (not (step6)) (step7))
  )

  (:action agent_1_move_d_left_right
    :parameters ()
    :precondition (and (step7) (on d left) (not (on a left)) (not (on b left)) (not (on c left)) (not (on a right)) (not (on b right)) (not (on c right)) (can-agent1 d))
    :effect (and (not (on d left)) (on d right) (not (step7)) (step8))
  )

  (:action agent_1_move_a_middle_right_2
    :parameters ()
    :precondition (and (step8) (on a middle) (can-agent1 a))
    :effect (and (not (on a middle)) (on a right) (not (step8)) (step9))
  )

  (:action agent_1_move_b_middle_left
    :parameters ()
    :precondition (and (step9) (on b middle) (not (on a middle)) (not (on a left)) (can-agent1 b))
    :effect (and (not (on b middle)) (on b left) (not (step9)) (step10))
  )
)