(define (domain hanoi-3agents-10disks-instance11)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step)

  (:constants
    left middle right a b c d e f g h i j - place
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - step
  )

  (:predicates
    (on ?d - place ?p - place)
    (at-step ?s - step)
  )

  (:action agent_1_move_1_a_left_middle
    :parameters ()
    :precondition (and (at-step s0) (on a b))
    :effect (and
      (not (on a b)) (on a middle)
      (not (at-step s0)) (at-step s1)
    )
  )

  (:action agent_1_move_2_b_left_right
    :parameters ()
    :precondition (and (at-step s1) (on b c))
    :effect (and
      (not (on b c)) (on b right)
      (not (at-step s1)) (at-step s2)
    )
  )

  (:action agent_1_move_3_a_middle_right_onto_b
    :parameters ()
    :precondition (and (at-step s2) (on a middle) (on b right))
    :effect (and
      (not (on a middle)) (on a b)
      (not (at-step s2)) (at-step s3)
    )
  )

  (:action agent_1_move_4_c_left_middle
    :parameters ()
    :precondition (and (at-step s3) (on c d))
    :effect (and
      (not (on c d)) (on c middle)
      (not (at-step s3)) (at-step s4)
    )
  )

  (:action agent_1_move_5_a_right_left_onto_d
    :parameters ()
    :precondition (and (at-step s4) (on a b) (on d e))
    :effect (and
      (not (on a b)) (on a d)
      (not (at-step s4)) (at-step s5)
    )
  )

  (:action agent_1_move_6_b_right_middle_onto_c
    :parameters ()
    :precondition (and (at-step s5) (on b right) (on c middle))
    :effect (and
      (not (on b right)) (on b c)
      (not (at-step s5)) (at-step s6)
    )
  )

  (:action agent_1_move_7_a_left_middle_onto_b
    :parameters ()
    :precondition (and (at-step s6) (on a d) (on b c))
    :effect (and
      (not (on a d)) (on a b)
      (not (at-step s6)) (at-step s7)
    )
  )

  (:action agent_1_move_8_d_left_right
    :parameters ()
    :precondition (and (at-step s7) (on d e))
    :effect (and
      (not (on d e)) (on d right)
      (not (at-step s7)) (at-step s8)
    )
  )

  (:action agent_1_move_9_a_middle_right_onto_d
    :parameters ()
    :precondition (and (at-step s8) (on a b) (on d right))
    :effect (and
      (not (on a b)) (on a d)
      (not (at-step s8)) (at-step s9)
    )
  )

  (:action agent_1_move_10_b_middle_left_onto_e
    :parameters ()
    :precondition (and (at-step s9) (on b c) (on e f))
    :effect (and
      (not (on b c)) (on b e)
      (not (at-step s9)) (at-step s10)
    )
  )

  (:action agent_1_move_11_a_right_left_onto_b
    :parameters ()
    :precondition (and (at-step s10) (on a d) (on b e))
    :effect (and
      (not (on a d)) (on a b)
      (not (at-step s10)) (at-step s11)
    )
  )

  (:action agent_1_move_12_c_middle_right_onto_d
    :parameters ()
    :precondition (and (at-step s11) (on c middle) (on d right))
    :effect (and
      (not (on c middle)) (on c d)
      (not (at-step s11)) (at-step s12)
    )
  )

  (:action agent_1_move_13_a_left_middle
    :parameters ()
    :precondition (and (at-step s12) (on a b))
    :effect (and
      (not (on a b)) (on a middle)
      (not (at-step s12)) (at-step s13)
    )
  )

  (:action agent_1_move_14_b_left_right_onto_c
    :parameters ()
    :precondition (and (at-step s13) (on b e) (on c d))
    :effect (and
      (not (on b e)) (on b c)
      (not (at-step s13)) (at-step s14)
    )
  )

  (:action agent_1_move_15_a_middle_right_onto_b
    :parameters ()
    :precondition (and (at-step s14) (on a middle) (on b c))
    :effect (and
      (not (on a middle)) (on a b)
      (not (at-step s14)) (at-step s15)
    )
  )

  (:action agent_2_move_16_e_left_middle
    :parameters ()
    :precondition (and (at-step s15) (on e f))
    :effect (and
      (not (on e f)) (on e middle)
      (not (at-step s15)) (at-step s16)
    )
  )

  (:action agent_1_move_17_a_right_middle_onto_e
    :parameters ()
    :precondition (and (at-step s16) (on a b) (on e middle))
    :effect (and
      (not (on a b)) (on a e)
      (not (at-step s16)) (at-step s17)
    )
  )

  (:action agent_1_move_18_b_right_left_onto_f
    :parameters ()
    :precondition (and (at-step s17) (on b c) (on f g))
    :effect (and
      (not (on b c)) (on b f)
      (not (at-step s17)) (at-step s18)
    )
  )

  (:action agent_1_move_19_a_middle_left_onto_b
    :parameters ()
    :precondition (and (at-step s18) (on a e) (on b f))
    :effect (and
      (not (on a e)) (on a b)
      (not (at-step s18)) (at-step s19)
    )
  )

  (:action agent_1_move_20_c_right_middle_onto_e
    :parameters ()
    :precondition (and (at-step s19) (on c d) (on e middle))
    :effect (and
      (not (on c d)) (on c e)
      (not (at-step s19)) (at-step s20)
    )
  )
)