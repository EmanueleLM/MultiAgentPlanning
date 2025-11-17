(define (domain hanoi_multiagent_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place step)
  ;; disks and pegs are places: disk and peg are subtypes of place
  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)              ; nothing is on top of place ?p (place can be a disk or a peg)
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
    (agent1_allowed ?d - disk)      ; agent_1 permitted to move ?d
    (agent2_allowed ?d - disk)      ; agent_2 permitted to move ?d
    (agent3_allowed ?d - disk)      ; agent_3 permitted to move ?d
    (ready ?s - step)               ; sequencing facts to enforce exact order
  )

  ;; Action 1: A left -> right (peg)
  (:action move1_A_left_right
    :precondition (and (on A left) (clear A) (clear right) (agent1_allowed A) (ready step1))
    :effect (and
      (not (on A left)) (on A right)
      (clear left)
      (not (clear right))
      (not (ready step1)) (ready step2)
    )
  )

  ;; Action 2: B left -> middle (peg)
  (:action move2_B_left_middle
    :precondition (and (on B left) (clear B) (clear middle) (agent1_allowed B) (ready step2))
    :effect (and
      (not (on B left)) (on B middle)
      (clear left)
      (not (clear middle))
      (not (ready step2)) (ready step3)
    )
  )

  ;; Action 3: A right -> middle (onto B)
  (:action move3_A_right_B
    :precondition (and (on A right) (clear A) (clear B) (smaller A B) (agent1_allowed A) (ready step3))
    :effect (and
      (not (on A right)) (on A B)
      (clear right)
      (not (clear B))
      (not (ready step3)) (ready step4)
    )
  )

  ;; Action 4: C left -> right (peg)
  (:action move4_C_left_right
    :precondition (and (on C left) (clear C) (clear right) (agent1_allowed C) (ready step4))
    :effect (and
      (not (on C left)) (on C right)
      (clear left)
      (not (clear right))
      (not (ready step4)) (ready step5)
    )
  )

  ;; Action 5: A middle -> left (onto D)
  (:action move5_A_middle_D
    :precondition (and (on A B) (clear A) (clear D) (smaller A D) (agent1_allowed A) (ready step5))
    :effect (and
      (not (on A B)) (on A D)
      (clear B)
      (not (clear D))
      (not (ready step5)) (ready step6)
    )
  )

  ;; Action 6: B middle -> right (onto C)
  (:action move6_B_middle_C
    :precondition (and (on B middle) (clear B) (clear C) (smaller B C) (agent1_allowed B) (ready step6))
    :effect (and
      (not (on B middle)) (on B C)
      (clear middle)
      (not (clear C))
      (not (ready step6)) (ready step7)
    )
  )

  ;; Action 7: A left -> right (onto B)
  (:action move7_A_left_B
    :precondition (and (on A D) (clear A) (clear B) (smaller A B) (agent1_allowed A) (ready step7))
    :effect (and
      (not (on A D)) (on A B)
      (clear D)
      (not (clear B))
      (not (ready step7)) (ready step8)
    )
  )

  ;; Action 8: D left -> middle (peg)
  (:action move8_D_left_middle
    :precondition (and (on D left) (clear D) (clear middle) (agent1_allowed D) (ready step8))
    :effect (and
      (not (on D left)) (on D middle)
      (clear left)
      (not (clear middle))
      (not (ready step8)) (ready step9)
    )
  )

  ;; Action 9: A right -> middle (onto D)
  (:action move9_A_right_D
    :precondition (and (on A B) (clear A) (clear D) (smaller A D) (agent1_allowed A) (ready step9))
    :effect (and
      (not (on A B)) (on A D)
      (clear B)
      (not (clear D))
      (not (ready step9)) (ready step10)
    )
  )

  ;; Action 10: B right -> left (onto E)
  (:action move10_B_right_E
    :precondition (and (on B C) (clear B) (clear E) (smaller B E) (agent1_allowed B) (ready step10))
    :effect (and
      (not (on B C)) (on B E)
      (clear C)
      (not (clear E))
      (not (ready step10)) (ready step11)
    )
  )

  ;; Action 11: A middle -> left (onto B)
  (:action move11_A_middle_B
    :precondition (and (on A D) (clear A) (clear B) (smaller A B) (agent1_allowed A) (ready step11))
    :effect (and
      (not (on A D)) (on A B)
      (clear D)
      (not (clear B))
      (not (ready step11)) (ready step12)
    )
  )

  ;; Action 12: C right -> middle (onto D)
  (:action move12_C_right_D
    :precondition (and (on C right) (clear C) (clear D) (smaller C D) (agent1_allowed C) (ready step12))
    :effect (and
      (not (on C right)) (on C D)
      (clear right)
      (not (clear D))
      (not (ready step12))
    )
  )
)