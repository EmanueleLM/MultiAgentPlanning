(define (domain hanoi2agents_hardcoded)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent step - object)

  (:constants
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 - step
  )

  (:predicates
    (on ?d - disk ?s - object)
    (smaller ?d1 - disk ?d2 - disk)
    (at-step ?k - step)
  )

  (:action agent_1_move_01_a_left_middle
    :parameters ()
    :precondition (and
      (at-step step0)
      (on a left)
      (not (on a a)) (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      (not (on f a)) (not (on g a)) (not (on h a)) (not (on i a)) (not (on j a))
      (not (on a middle)) (not (on b middle)) (not (on c middle)) (not (on d middle)) (not (on e middle))
      (not (on f middle)) (not (on g middle)) (not (on h middle)) (not (on i middle)) (not (on j middle))
    )
    :effect (and
      (not (on a left))
      (on a middle)
      (not (at-step step0))
      (at-step step1)
    )
  )

  (:action agent_1_move_02_b_left_right
    :parameters ()
    :precondition (and
      (at-step step1)
      (on b left)
      (not (on a b)) (not (on b b)) (not (on c b)) (not (on d b)) (not (on e b))
      (not (on f b)) (not (on g b)) (not (on h b)) (not (on i b)) (not (on j b))
      (not (on a right)) (not (on b right)) (not (on c right)) (not (on d right)) (not (on e right))
      (not (on f right)) (not (on g right)) (not (on h right)) (not (on i right)) (not (on j right))
    )
    :effect (and
      (not (on b left))
      (on b right)
      (not (at-step step1))
      (at-step step2)
    )
  )

  (:action agent_1_move_03_a_middle_right
    :parameters ()
    :precondition (and
      (at-step step2)
      (on a middle)
      (not (on a a)) (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      (not (on f a)) (not (on g a)) (not (on h a)) (not (on i a)) (not (on j a))
      (on b right)
      (not (on a b)) (not (on b b)) (not (on c b)) (not (on d b)) (not (on e b))
      (not (on f b)) (not (on g b)) (not (on h b)) (not (on i b)) (not (on j b))
      (smaller a b)
    )
    :effect (and
      (not (on a middle))
      (on a right)
      (not (at-step step2))
      (at-step step3)
    )
  )

  (:action agent_1_move_04_c_left_middle
    :parameters ()
    :precondition (and
      (at-step step3)
      (on c left)
      (not (on a c)) (not (on b c)) (not (on c c)) (not (on d c)) (not (on e c))
      (not (on f c)) (not (on g c)) (not (on h c)) (not (on i c)) (not (on j c))
      (not (on a middle)) (not (on b middle)) (not (on c middle)) (not (on d middle)) (not (on e middle))
      (not (on f middle)) (not (on g middle)) (not (on h middle)) (not (on i middle)) (not (on j middle))
    )
    :effect (and
      (not (on c left))
      (on c middle)
      (not (at-step step3))
      (at-step step4)
    )
  )

  (:action agent_1_move_05_a_right_left
    :parameters ()
    :precondition (and
      (at-step step4)
      (on a right)
      (not (on a a)) (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      (not (on f a)) (not (on g a)) (not (on h a)) (not (on i a)) (not (on j a))
      (on d left)
      (not (on a d)) (not (on b d)) (not (on c d)) (not (on d d)) (not (on e d))
      (not (on f d)) (not (on g d)) (not (on h d)) (not (on i d)) (not (on j d))
      (smaller a d)
    )
    :effect (and
      (not (on a right))
      (on a left)
      (not (at-step step4))
      (at-step step5)
    )
  )

  (:action agent_1_move_06_b_right_middle
    :parameters ()
    :precondition (and
      (at-step step5)
      (on b right)
      (not (on a b)) (not (on b b)) (not (on c b)) (not (on d b)) (not (on e b))
      (not (on f b)) (not (on g b)) (not (on h b)) (not (on i b)) (not (on j b))
      (on c middle)
      (not (on a c)) (not (on b c)) (not (on c c)) (not (on d c)) (not (on e c))
      (not (on f c)) (not (on g c)) (not (on h c)) (not (on i c)) (not (on j c))
      (smaller b c)
    )
    :effect (and
      (not (on b right))
      (on b middle)
      (not (at-step step5))
      (at-step step6)
    )
  )

  (:action agent_1_move_07_a_left_middle
    :parameters ()
    :precondition (and
      (at-step step6)
      (on a left)
      (not (on a a)) (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      (not (on f a)) (not (on g a)) (not (on h a)) (not (on i a)) (not (on j a))
      (on b middle)
      (not (on a b)) (not (on b b)) (not (on c b)) (not (on d b)) (not (on e b))
      (not (on f b)) (not (on g b)) (not (on h b)) (not (on i b)) (not (on j b))
      (smaller a b)
    )
    :effect (and
      (not (on a left))
      (on a middle)
      (not (at-step step6))
      (at-step step7)
    )
  )

  (:action agent_1_move_08_d_left_right
    :parameters ()
    :precondition (and
      (at-step step7)
      (on d left)
      (not (on a d)) (not (on b d)) (not (on c d)) (not (on d d)) (not (on e d))
      (not (on f d)) (not (on g d)) (not (on h d)) (not (on i d)) (not (on j d))
      (not (on a right)) (not (on b right)) (not (on c right)) (not (on d right)) (not (on e right))
      (not (on f right)) (not (on g right)) (not (on h right)) (not (on i right)) (not (on j right))
    )
    :effect (and
      (not (on d left))
      (on d right)
      (not (at-step step7))
      (at-step step8)
    )
  )

  (:action agent_1_move_09_a_middle_right
    :parameters ()
    :precondition (and
      (at-step step8)
      (on a middle)
      (not (on a a)) (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      (not (on f a)) (not (on g a)) (not (on h a)) (not (on i a)) (not (on j a))
      (on d right)
      (not (on a d)) (not (on b d)) (not (on c d)) (not (on d d)) (not (on e d))
      (not (on f d)) (not (on g d)) (not (on h d)) (not (on i d)) (not (on j d))
      (smaller a d)
    )
    :effect (and
      (not (on a middle))
      (on a right)
      (not (at-step step8))
      (at-step step9)
    )
  )

  (:action agent_1_move_10_b_middle_left
    :parameters ()
    :precondition (and
      (at-step step9)
      (on b middle)
      (not (on a b)) (not (on b b)) (not (on c b)) (not (on d b)) (not (on e b))
      (not (on f b)) (not (on g b)) (not (on h b)) (not (on i b)) (not (on j b))
      (on e left)
      (not (on a e)) (not (on b e)) (not (on c e)) (not (on d e)) (not (on e e))
      (not (on f e)) (not (on g e)) (not (on h e)) (not (on i e)) (not (on j e))
      (smaller b e)
    )
    :effect (and
      (not (on b middle))
      (on b left)
      (not (at-step step9))
      (at-step step10)
    )
  )

  (:action agent_1_move_11_a_right_left
    :parameters ()
    :precondition (and
      (at-step step10)
      (on a right)
      (not (on a a)) (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      (not (on f a)) (not (on g a)) (not (on h a)) (not (on i a)) (not (on j a))
      (on b left)
      (not (on a b)) (not (on b b)) (not (on c b)) (not (on d b)) (not (on e b))
      (not (on f b)) (not (on g b)) (not (on h b)) (not (on i b)) (not (on j b))
      (smaller a b)
    )
    :effect (and
      (not (on a right))
      (on a left)
      (not (at-step step10))
      (at-step step11)
    )
  )

  (:action agent_1_move_12_c_middle_right
    :parameters ()
    :precondition (and
      (at-step step11)
      (on c middle)
      (not (on a c)) (not (on b c)) (not (on c c)) (not (on d c)) (not (on e c))
      (not (on f c)) (not (on g c)) (not (on h c)) (not (on i c)) (not (on j c))
      (on d right)
      (not (on a d)) (not (on b d)) (not (on c d)) (not (on d d)) (not (on e d))
      (not (on f d)) (not (on g d)) (not (on h d)) (not (on i d)) (not (on j d))
      (smaller c d)
    )
    :effect (and
      (not (on c middle))
      (on c right)
      (not (at-step step11))
      (at-step step12)
    )
  )

  (:action agent_1_move_13_a_left_middle
    :parameters ()
    :precondition (and
      (at-step step12)
      (on a left)
      (not (on a a)) (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      (not (on f a)) (not (on g a)) (not (on h a)) (not (on i a)) (not (on j a))
      (not (on a middle)) (not (on b middle)) (not (on c middle)) (not (on d middle)) (not (on e middle))
      (not (on f middle)) (not (on g middle)) (not (on h middle)) (not (on i middle)) (not (on j middle))
    )
    :effect (and
      (not (on a left))
      (on a middle)
      (not (at-step step12))
      (at-step step13)
    )
  )
)