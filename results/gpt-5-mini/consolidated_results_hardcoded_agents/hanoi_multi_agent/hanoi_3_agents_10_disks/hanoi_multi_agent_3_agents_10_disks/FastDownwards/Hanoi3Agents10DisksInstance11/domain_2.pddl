(define (domain hanoi-3agents-10disks-instance11)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - place step)
  (:predicates
    (on ?d - disk ?p - place)
    (at-step ?s - step)
  )

  (:action agent_1_move_1_A_left_middle
    :parameters ()
    :precondition (and (at-step s0) (on A B))
    :effect (and
      (not (on A B)) (on A middle)
      (not (at-step s0)) (at-step s1)
    )
  )

  (:action agent_1_move_2_B_left_right
    :parameters ()
    :precondition (and (at-step s1) (on B C))
    :effect (and
      (not (on B C)) (on B right)
      (not (at-step s1)) (at-step s2)
    )
  )

  (:action agent_1_move_3_A_middle_right_onto_B
    :parameters ()
    :precondition (and (at-step s2) (on A middle) (on B right))
    :effect (and
      (not (on A middle)) (on A B)
      (not (at-step s2)) (at-step s3)
    )
  )

  (:action agent_1_move_4_C_left_middle
    :parameters ()
    :precondition (and (at-step s3) (on C D))
    :effect (and
      (not (on C D)) (on C middle)
      (not (at-step s3)) (at-step s4)
    )
  )

  (:action agent_1_move_5_A_right_left_onto_D
    :parameters ()
    :precondition (and (at-step s4) (on A B) (on D E))
    :effect (and
      (not (on A B)) (on A D)
      (not (at-step s4)) (at-step s5)
    )
  )

  (:action agent_1_move_6_B_right_middle_onto_C
    :parameters ()
    :precondition (and (at-step s5) (on B right) (on C middle))
    :effect (and
      (not (on B right)) (on B C)
      (not (at-step s5)) (at-step s6)
    )
  )

  (:action agent_1_move_7_A_left_middle_onto_B
    :parameters ()
    :precondition (and (at-step s6) (on A D) (on B C))
    :effect (and
      (not (on A D)) (on A B)
      (not (at-step s6)) (at-step s7)
    )
  )

  (:action agent_1_move_8_D_left_right
    :parameters ()
    :precondition (and (at-step s7) (on D E))
    :effect (and
      (not (on D E)) (on D right)
      (not (at-step s7)) (at-step s8)
    )
  )

  (:action agent_1_move_9_A_middle_right_onto_D
    :parameters ()
    :precondition (and (at-step s8) (on A B) (on D right))
    :effect (and
      (not (on A B)) (on A D)
      (not (at-step s8)) (at-step s9)
    )
  )

  (:action agent_1_move_10_B_middle_left_onto_E
    :parameters ()
    :precondition (and (at-step s9) (on B C) (on E F))
    :effect (and
      (not (on B C)) (on B E)
      (not (at-step s9)) (at-step s10)
    )
  )

  (:action agent_1_move_11_A_right_left_onto_B
    :parameters ()
    :precondition (and (at-step s10) (on A D) (on B E))
    :effect (and
      (not (on A D)) (on A B)
      (not (at-step s10)) (at-step s11)
    )
  )

  (:action agent_1_move_12_C_middle_right_onto_D
    :parameters ()
    :precondition (and (at-step s11) (on C middle) (on D right))
    :effect (and
      (not (on C middle)) (on C D)
      (not (at-step s11)) (at-step s12)
    )
  )

  (:action agent_1_move_13_A_left_middle
    :parameters ()
    :precondition (and (at-step s12) (on A B))
    :effect (and
      (not (on A B)) (on A middle)
      (not (at-step s12)) (at-step s13)
    )
  )

  (:action agent_1_move_14_B_left_right_onto_C
    :parameters ()
    :precondition (and (at-step s13) (on B E) (on C D))
    :effect (and
      (not (on B E)) (on B C)
      (not (at-step s13)) (at-step s14)
    )
  )

  (:action agent_1_move_15_A_middle_right_onto_B
    :parameters ()
    :precondition (and (at-step s14) (on A middle) (on B C))
    :effect (and
      (not (on A middle)) (on A B)
      (not (at-step s14)) (at-step s15)
    )
  )

  (:action agent_2_move_16_E_left_middle
    :parameters ()
    :precondition (and (at-step s15) (on E F))
    :effect (and
      (not (on E F)) (on E middle)
      (not (at-step s15)) (at-step s16)
    )
  )

  (:action agent_1_move_17_A_right_middle_onto_E
    :parameters ()
    :precondition (and (at-step s16) (on A B) (on E middle))
    :effect (and
      (not (on A B)) (on A E)
      (not (at-step s16)) (at-step s17)
    )
  )

  (:action agent_1_move_18_B_right_left_onto_F
    :parameters ()
    :precondition (and (at-step s17) (on B C) (on F G))
    :effect (and
      (not (on B C)) (on B F)
      (not (at-step s17)) (at-step s18)
    )
  )

  (:action agent_1_move_19_A_middle_left_onto_B
    :parameters ()
    :precondition (and (at-step s18) (on A E) (on B F))
    :effect (and
      (not (on A E)) (on A B)
      (not (at-step s18)) (at-step s19)
    )
  )

  (:action agent_1_move_20_C_right_middle_onto_E
    :parameters ()
    :precondition (and (at-step s19) (on C D) (on E middle))
    :effect (and
      (not (on C D)) (on C E)
      (not (at-step s19)) (at-step s20)
    )
  )
)