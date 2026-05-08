(define (domain hanoi_2agents_15_disks_instance17)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (at ?d - disk ?p - peg)
  )

  ;; Action 1: agent_1 moves A from left to middle (preconditions = full state before move 1)
  (:action agent_1_move_01_A_left_middle
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

  ;; Action 2
  (:action agent_1_move_02_B_left_right
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

  ;; Action 3
  (:action agent_1_move_03_A_middle_right
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

  ;; Action 4
  (:action agent_1_move_04_C_left_middle
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

  ;; Action 5
  (:action agent_1_move_05_A_right_left
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

  ;; Action 6
  (:action agent_1_move_06_B_right_middle
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

  ;; Action 7
  (:action agent_1_move_07_A_left_middle
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

  ;; Action 8
  (:action agent_1_move_08_D_left_right
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

  ;; Action 9
  (:action agent_1_move_09_A_middle_right
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

  ;; Action 10
  (:action agent_1_move_10_B_middle_left
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

  ;; Action 11
  (:action agent_1_move_11_A_right_left
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

  ;; Action 12
  (:action agent_1_move_12_C_middle_right
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

  ;; Action 13
  (:action agent_1_move_13_A_left_middle
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

  ;; Action 14
  (:action agent_1_move_14_B_left_right
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

  ;; Action 15
  (:action agent_1_move_15_A_middle_right
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

  ;; Action 16
  (:action agent_1_move_16_E_left_middle
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

  ;; Action 17
  (:action agent_1_move_17_A_right_left
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

  ;; Action 18
  (:action agent_1_move_18_B_right_middle
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

  ;; Action 19
  (:action agent_1_move_19_A_left_middle
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

  ;; Action 20
  (:action agent_1_move_20_C_right_left
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

  ;; Action 21
  (:action agent_1_move_21_A_middle_right
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

  ;; Action 22
  (:action agent_1_move_22_B_middle_left
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

  ;; Action 23
  (:action agent_1_move_23_A_right_left
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

  ;; Action 24
  (:action agent_1_move_24_D_right_middle
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

  ;; Action 25
  (:action agent_1_move_25_A_left_right
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

  ;; Action 26
  (:action agent_1_move_26_B_left_middle
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

  ;; Action 27
  (:action agent_1_move_27_A_right_middle
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

  ;; Action 28
  (:action agent_1_move_28_C_left_right
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