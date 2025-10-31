(define (domain hanoi-3agents-10disks-instance11)
  (:requirements :strips :typing :negative-preconditions)
  (:types place peg disk step)
  ;; pegs and disks are places (in objects we will declare them)
  (:predicates
    (on ?d - disk ?p - place)       ; disk d is directly on place p (place = peg or disk)
    (at-step ?s - step)            ; control-state marker to enforce sequence
  )

  ;; Actions are named with agent prefixes to show which agent performs them.
  ;; Each action is a primitive move that is only applicable in a single step,
  ;; and transforms the single 'on' fact for the moved disk to its new support.
  ;; No other moves are available, so the unique feasible plan is the sequence of these actions.

  ;; Step 0 -> Step 1
  (:action agent_1_move_1_A_left_middle
    :precondition (and (at-step s0) (on A B))
    :effect (and
      (not (on A B)) (on A middle)
      (not (at-step s0)) (at-step s1)
    )
  )

  ;; Step 1 -> Step 2
  (:action agent_1_move_2_B_left_right
    :precondition (and (at-step s1) (on B C))
    :effect (and
      (not (on B C)) (on B right)
      (not (at-step s1)) (at-step s2)
    )
  )

  ;; Step 2 -> Step 3 (A onto B)
  (:action agent_1_move_3_A_middle_right_onto_B
    :precondition (and (at-step s2) (on A middle) (on B right))
    :effect (and
      (not (on A middle)) (on A B)
      (not (at-step s2)) (at-step s3)
    )
  )

  ;; Step 3 -> Step 4
  (:action agent_1_move_4_C_left_middle
    :precondition (and (at-step s3) (on C D))
    :effect (and
      (not (on C D)) (on C middle)
      (not (at-step s3)) (at-step s4)
    )
  )

  ;; Step 4 -> Step 5 (A from right onto D)
  (:action agent_1_move_5_A_right_left_onto_D
    :precondition (and (at-step s4) (on A B) (on D E))
    :effect (and
      (not (on A B)) (on A D)
      (not (at-step s4)) (at-step s5)
    )
  )

  ;; Step 5 -> Step 6 (B from right onto C)
  (:action agent_1_move_6_B_right_middle_onto_C
    :precondition (and (at-step s5) (on B right) (on C middle))
    :effect (and
      (not (on B right)) (on B C)
      (not (at-step s5)) (at-step s6)
    )
  )

  ;; Step 6 -> Step 7 (A from left onto B)
  (:action agent_1_move_7_A_left_middle_onto_B
    :precondition (and (at-step s6) (on A D) (on B C))
    :effect (and
      (not (on A D)) (on A B)
      (not (at-step s6)) (at-step s7)
    )
  )

  ;; Step 7 -> Step 8 (D from left to right)
  (:action agent_1_move_8_D_left_right
    :precondition (and (at-step s7) (on D E))
    :effect (and
      (not (on D E)) (on D right)
      (not (at-step s7)) (at-step s8)
    )
  )

  ;; Step 8 -> Step 9 (A from middle onto D)
  (:action agent_1_move_9_A_middle_right_onto_D
    :precondition (and (at-step s8) (on A B) (on D right))
    :effect (and
      (not (on A B)) (on A D)
      (not (at-step s8)) (at-step s9)
    )
  )

  ;; Step 9 -> Step 10 (B to left onto E)
  (:action agent_1_move_10_B_middle_left_onto_E
    :precondition (and (at-step s9) (on B C) (on E F))
    :effect (and
      (not (on B C)) (on B E)
      (not (at-step s9)) (at-step s10)
    )
  )

  ;; Step 10 -> Step 11 (A right->left onto B)
  (:action agent_1_move_11_A_right_left_onto_B
    :precondition (and (at-step s10) (on A D) (on B E))
    :effect (and
      (not (on A D)) (on A B)
      (not (at-step s10)) (at-step s11)
    )
  )

  ;; Step 11 -> Step 12 (C middle -> right onto D)
  (:action agent_1_move_12_C_middle_right_onto_D
    :precondition (and (at-step s11) (on C middle) (on D right))
    :effect (and
      (not (on C middle)) (on C D)
      (not (at-step s11)) (at-step s12)
    )
  )

  ;; Step 12 -> Step 13 (A left -> middle)
  (:action agent_1_move_13_A_left_middle
    :precondition (and (at-step s12) (on A B))
    :effect (and
      (not (on A B)) (on A middle)
      (not (at-step s12)) (at-step s13)
    )
  )

  ;; Step 13 -> Step 14 (B left -> right onto C)
  (:action agent_1_move_14_B_left_right_onto_C
    :precondition (and (at-step s13) (on B E) (on C D))
    :effect (and
      (not (on B E)) (on B C)
      (not (at-step s13)) (at-step s14)
    )
  )

  ;; Step 14 -> Step 15 (A middle -> right onto B)
  (:action agent_1_move_15_A_middle_right_onto_B
    :precondition (and (at-step s14) (on A middle) (on B C))
    :effect (and
      (not (on A middle)) (on A B)
      (not (at-step s14)) (at-step s15)
    )
  )

  ;; Step 15 -> Step 16 (E left -> middle) -- agent_2 moves E
  (:action agent_2_move_16_E_left_middle
    :precondition (and (at-step s15) (on E F))
    :effect (and
      (not (on E F)) (on E middle)
      (not (at-step s15)) (at-step s16)
    )
  )

  ;; Step 16 -> Step 17 (A right -> middle onto E)
  (:action agent_1_move_17_A_right_middle_onto_E
    :precondition (and (at-step s16) (on A B) (on E middle))
    :effect (and
      (not (on A B)) (on A E)
      (not (at-step s16)) (at-step s17)
    )
  )

  ;; Step 17 -> Step 18 (B right -> left onto F)
  (:action agent_1_move_18_B_right_left_onto_F
    :precondition (and (at-step s17) (on B C) (on F G))
    :effect (and
      (not (on B C)) (on B F)
      (not (at-step s17)) (at-step s18)
    )
  )

  ;; Step 18 -> Step 19 (A middle -> left onto B)
  (:action agent_1_move_19_A_middle_left_onto_B
    :precondition (and (at-step s18) (on A E) (on B F))
    :effect (and
      (not (on A E)) (on A B)
      (not (at-step s18)) (at-step s19)
    )
  )

  ;; Step 19 -> Step 20 (C right -> middle onto E)
  (:action agent_1_move_20_C_right_middle_onto_E
    :precondition (and (at-step s19) (on C D) (on E middle))
    :effect (and
      (not (on C D)) (on C E)
      (not (at-step s19)) (at-step s20)
    )
  )
)