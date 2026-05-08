(define (domain hanoi_multiagent_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)
  (:predicates
    (on ?d - disk ?p - object)
    (clear ?p - object)
    (smaller ?d1 - disk ?d2 - disk)
    (agent1_allowed ?d - disk)
    (agent2_allowed ?d - disk)
    (agent3_allowed ?d - disk)
    (ready ?s - step)
  )

  (:action move1_A_left_right
    :parameters ()
    :precondition (and (on A left) (clear A) (clear right) (agent1_allowed A) (ready step1))
    :effect (and
      (not (on A left)) (on A right)
      (clear left)
      (not (clear right))
      (not (ready step1)) (ready step2)
    )
  )

  (:action move2_B_left_middle
    :parameters ()
    :precondition (and (on B left) (clear B) (clear middle) (agent1_allowed B) (ready step2))
    :effect (and
      (not (on B left)) (on B middle)
      (clear left)
      (not (clear middle))
      (not (ready step2)) (ready step3)
    )
  )

  (:action move3_A_right_B
    :parameters ()
    :precondition (and (on A right) (clear A) (clear B) (smaller A B) (agent1_allowed A) (ready step3))
    :effect (and
      (not (on A right)) (on A B)
      (clear right)
      (not (clear B))
      (not (ready step3)) (ready step4)
    )
  )

  (:action move4_C_left_right
    :parameters ()
    :precondition (and (on C left) (clear C) (clear right) (agent1_allowed C) (ready step4))
    :effect (and
      (not (on C left)) (on C right)
      (clear left)
      (not (clear right))
      (not (ready step4)) (ready step5)
    )
  )

  (:action move5_A_middle_D
    :parameters ()
    :precondition (and (on A B) (clear A) (clear D) (smaller A D) (agent1_allowed A) (ready step5))
    :effect (and
      (not (on A B)) (on A D)
      (clear B)
      (not (clear D))
      (not (ready step5)) (ready step6)
    )
  )

  (:action move6_B_middle_C
    :parameters ()
    :precondition (and (on B middle) (clear B) (clear C) (smaller B C) (agent1_allowed B) (ready step6))
    :effect (and
      (not (on B middle)) (on B C)
      (clear middle)
      (not (clear C))
      (not (ready step6)) (ready step7)
    )
  )

  (:action move7_A_left_B
    :parameters ()
    :precondition (and (on A D) (clear A) (clear B) (smaller A B) (agent1_allowed A) (ready step7))
    :effect (and
      (not (on A D)) (on A B)
      (clear D)
      (not (clear B))
      (not (ready step7)) (ready step8)
    )
  )

  (:action move8_D_left_middle
    :parameters ()
    :precondition (and (on D left) (clear D) (clear middle) (agent1_allowed D) (ready step8))
    :effect (and
      (not (on D left)) (on D middle)
      (clear left)
      (not (clear middle))
      (not (ready step8)) (ready step9)
    )
  )

  (:action move9_A_right_D
    :parameters ()
    :precondition (and (on A B) (clear A) (clear D) (smaller A D) (agent1_allowed A) (ready step9))
    :effect (and
      (not (on A B)) (on A D)
      (clear B)
      (not (clear D))
      (not (ready step9)) (ready step10)
    )
  )

  (:action move10_B_right_E
    :parameters ()
    :precondition (and (on B C) (clear B) (clear E) (smaller B E) (agent1_allowed B) (ready step10))
    :effect (and
      (not (on B C)) (on B E)
      (clear C)
      (not (clear E))
      (not (ready step10)) (ready step11)
    )
  )

  (:action move11_A_middle_B
    :parameters ()
    :precondition (and (on A D) (clear A) (clear B) (smaller A B) (agent1_allowed A) (ready step11))
    :effect (and
      (not (on A D)) (on A B)
      (clear D)
      (not (clear B))
      (not (ready step11)) (ready step12)
    )
  )

  (:action move12_C_right_D
    :parameters ()
    :precondition (and (on C right) (clear C) (clear D) (smaller C D) (agent1_allowed C) (ready step12))
    :effect (and
      (not (on C right)) (on C D)
      (clear right)
      (not (clear D))
      (not (ready step12))
    )
  )
)