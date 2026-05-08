(define (domain hanoi_2agents_15_disks_instance17)
  (:requirements :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (at ?d - disk ?p - peg)
  )

  (:action agent_1_move_01_a_left_middle
    :parameters ()
    :precondition (and
      (at a left) (at b left) (at c left) (at d left) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a left)) (at a middle)
    )
  )

  (:action agent_1_move_02_b_left_right
    :parameters ()
    :precondition (and
      (at a middle) (at b left) (at c left) (at d left) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at b left)) (at b right)
    )
  )

  (:action agent_1_move_03_a_middle_right
    :parameters ()
    :precondition (and
      (at a middle) (at b right) (at c left) (at d left) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a middle)) (at a right)
    )
  )

  (:action agent_1_move_04_c_left_middle
    :parameters ()
    :precondition (and
      (at a right) (at b right) (at c left) (at d left) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at c left)) (at c middle)
    )
  )

  (:action agent_1_move_05_a_right_left
    :parameters ()
    :precondition (and
      (at a right) (at b right) (at c middle) (at d left) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a right)) (at a left)
    )
  )

  (:action agent_1_move_06_b_right_middle
    :parameters ()
    :precondition (and
      (at a left) (at b right) (at c middle) (at d left) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at b right)) (at b middle)
    )
  )

  (:action agent_1_move_07_a_left_middle
    :parameters ()
    :precondition (and
      (at a left) (at b middle) (at c middle) (at d left) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a left)) (at a middle)
    )
  )

  (:action agent_1_move_08_d_left_right
    :parameters ()
    :precondition (and
      (at a middle) (at b middle) (at c middle) (at d left) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at d left)) (at d right)
    )
  )

  (:action agent_1_move_09_a_middle_right
    :parameters ()
    :precondition (and
      (at a middle) (at b middle) (at c middle) (at d right) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a middle)) (at a right)
    )
  )

  (:action agent_1_move_10_b_middle_left
    :parameters ()
    :precondition (and
      (at a right) (at b middle) (at c middle) (at d right) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at b middle)) (at b left)
    )
  )

  (:action agent_1_move_11_a_right_left
    :parameters ()
    :precondition (and
      (at a right) (at b left) (at c middle) (at d right) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a right)) (at a left)
    )
  )

  (:action agent_1_move_12_c_middle_right
    :parameters ()
    :precondition (and
      (at a left) (at b left) (at c middle) (at d right) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at c middle)) (at c right)
    )
  )

  (:action agent_1_move_13_a_left_middle
    :parameters ()
    :precondition (and
      (at a left) (at b left) (at c right) (at d right) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a left)) (at a middle)
    )
  )

  (:action agent_1_move_14_b_left_right
    :parameters ()
    :precondition (and
      (at a middle) (at b left) (at c right) (at d right) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at b left)) (at b right)
    )
  )

  (:action agent_1_move_15_a_middle_right
    :parameters ()
    :precondition (and
      (at a middle) (at b right) (at c right) (at d right) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a middle)) (at a right)
    )
  )

  (:action agent_1_move_16_e_left_middle
    :parameters ()
    :precondition (and
      (at a right) (at b right) (at c right) (at d right) (at e left)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at e left)) (at e middle)
    )
  )

  (:action agent_1_move_17_a_right_left
    :parameters ()
    :precondition (and
      (at a right) (at b right) (at c right) (at d right) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a right)) (at a left)
    )
  )

  (:action agent_1_move_18_b_right_middle
    :parameters ()
    :precondition (and
      (at a left) (at b right) (at c right) (at d right) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at b right)) (at b middle)
    )
  )

  (:action agent_1_move_19_a_left_middle
    :parameters ()
    :precondition (and
      (at a left) (at b middle) (at c right) (at d right) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a left)) (at a middle)
    )
  )

  (:action agent_1_move_20_c_right_left
    :parameters ()
    :precondition (and
      (at a middle) (at b middle) (at c right) (at d right) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at c right)) (at c left)
    )
  )

  (:action agent_1_move_21_a_middle_right
    :parameters ()
    :precondition (and
      (at a middle) (at b middle) (at c left) (at d right) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a middle)) (at a right)
    )
  )

  (:action agent_1_move_22_b_middle_left
    :parameters ()
    :precondition (and
      (at a right) (at b middle) (at c left) (at d right) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at b middle)) (at b left)
    )
  )

  (:action agent_1_move_23_a_right_left
    :parameters ()
    :precondition (and
      (at a right) (at b left) (at c left) (at d right) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a right)) (at a left)
    )
  )

  (:action agent_1_move_24_d_right_middle
    :parameters ()
    :precondition (and
      (at a left) (at b left) (at c left) (at d right) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at d right)) (at d middle)
    )
  )

  (:action agent_1_move_25_a_left_right
    :parameters ()
    :precondition (and
      (at a left) (at b left) (at c left) (at d middle) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a left)) (at a right)
    )
  )

  (:action agent_1_move_26_b_left_middle
    :parameters ()
    :precondition (and
      (at a right) (at b left) (at c left) (at d middle) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at b left)) (at b middle)
    )
  )

  (:action agent_1_move_27_a_right_middle
    :parameters ()
    :precondition (and
      (at a right) (at b middle) (at c left) (at d middle) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at a right)) (at a middle)
    )
  )

  (:action agent_1_move_28_c_left_right
    :parameters ()
    :precondition (and
      (at a middle) (at b middle) (at c left) (at d middle) (at e middle)
      (at f left) (at g left) (at h left) (at i left) (at j left)
      (at k left) (at l left) (at m left) (at n left) (at o left)
    )
    :effect (and
      (not (at c left)) (at c right)
    )
  )

)