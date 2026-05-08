(define (domain hanoi_multiagent_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (agent1_allowed ?d - disk)
    (agent2_allowed ?d - disk)
    (agent3_allowed ?d - disk)
    (ready ?s - step)
  )

  (:action move1_a_left_right
    :parameters ()
    :precondition (and (on a left) (clear a) (clear right) (agent1_allowed a) (ready step1))
    :effect (and
      (not (on a left)) (on a right)
      (clear left)
      (not (clear right))
      (not (ready step1)) (ready step2)
    )
  )

  (:action move2_b_left_middle
    :parameters ()
    :precondition (and (on b left) (clear b) (clear middle) (agent1_allowed b) (ready step2))
    :effect (and
      (not (on b left)) (on b middle)
      (clear left)
      (not (clear middle))
      (not (ready step2)) (ready step3)
    )
  )

  (:action move3_a_right_b
    :parameters ()
    :precondition (and (on a right) (clear a) (clear b) (smaller a b) (agent1_allowed a) (ready step3))
    :effect (and
      (not (on a right)) (on a b)
      (clear right)
      (not (clear b))
      (not (ready step3)) (ready step4)
    )
  )

  (:action move4_c_left_right
    :parameters ()
    :precondition (and (on c left) (clear c) (clear right) (agent1_allowed c) (ready step4))
    :effect (and
      (not (on c left)) (on c right)
      (clear left)
      (not (clear right))
      (not (ready step4)) (ready step5)
    )
  )

  (:action move5_a_b_d
    :parameters ()
    :precondition (and (on a b) (clear a) (clear d) (smaller a d) (agent1_allowed a) (ready step5))
    :effect (and
      (not (on a b)) (on a d)
      (clear b)
      (not (clear d))
      (not (ready step5)) (ready step6)
    )
  )

  (:action move6_b_middle_c
    :parameters ()
    :precondition (and (on b middle) (clear b) (clear c) (smaller b c) (agent1_allowed b) (ready step6))
    :effect (and
      (not (on b middle)) (on b c)
      (clear middle)
      (not (clear c))
      (not (ready step6)) (ready step7)
    )
  )

  (:action move7_a_d_b
    :parameters ()
    :precondition (and (on a d) (clear a) (clear b) (smaller a b) (agent1_allowed a) (ready step7))
    :effect (and
      (not (on a d)) (on a b)
      (clear d)
      (not (clear b))
      (not (ready step7)) (ready step8)
    )
  )

  (:action move8_d_left_middle
    :parameters ()
    :precondition (and (on d left) (clear d) (clear middle) (agent1_allowed d) (ready step8))
    :effect (and
      (not (on d left)) (on d middle)
      (clear left)
      (not (clear middle))
      (not (ready step8)) (ready step9)
    )
  )

  (:action move9_a_right_d
    :parameters ()
    :precondition (and (on a b) (clear a) (clear d) (smaller a d) (agent1_allowed a) (ready step9))
    :effect (and
      (not (on a b)) (on a d)
      (clear b)
      (not (clear d))
      (not (ready step9)) (ready step10)
    )
  )

  (:action move10_b_right_e
    :parameters ()
    :precondition (and (on b c) (clear b) (clear e) (smaller b e) (agent1_allowed b) (ready step10))
    :effect (and
      (not (on b c)) (on b e)
      (clear c)
      (not (clear e))
      (not (ready step10)) (ready step11)
    )
  )

  (:action move11_a_middle_b
    :parameters ()
    :precondition (and (on a d) (clear a) (clear b) (smaller a b) (agent1_allowed a) (ready step11))
    :effect (and
      (not (on a d)) (on a b)
      (clear d)
      (not (clear b))
      (not (ready step11)) (ready step12)
    )
  )

  (:action move12_c_right_d
    :parameters ()
    :precondition (and (on c right) (clear c) (clear d) (smaller c d) (agent1_allowed c) (ready step12))
    :effect (and
      (not (on c right)) (on c d)
      (clear right)
      (not (clear d))
      (not (ready step12))
    )
  )
)