(define (domain trip_13_days_three_cities)
  (:requirements :strips :typing :negative-preconditions)
  (:types day)

  (:predicates
    (next_day ?d1 - day ?d2 - day)

    (assigned ?d - day)
    (current_day ?d - day)
    (started)

    (at_florence ?d - day)
    (at_munich ?d - day)
    (at_warsaw ?d - day)

    (florence_count_0)
    (florence_count_1)
    (florence_count_2)

    (munich_count_0)
    (munich_count_1)
    (munich_count_2)
    (munich_count_3)
    (munich_count_4)
    (munich_count_5)
    (munich_count_6)

    (warsaw_count_0)
    (warsaw_count_1)
    (warsaw_count_2)
    (warsaw_count_3)
    (warsaw_count_4)
    (warsaw_count_5)
    (warsaw_count_6)
    (warsaw_count_7)

    (florence_done)
    (munich_done)
    (warsaw_done)
  )

  (:action start_in_florence_from_0
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned d1))
      (florence_count_0))
    :effect (and
      (started)
      (assigned d1)
      (current_day d1)
      (at_florence d1)
      (not (florence_count_0))
      (florence_count_1))
  )

  (:action start_in_munich_from_0
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned d1))
      (munich_count_0))
    :effect (and
      (started)
      (assigned d1)
      (current_day d1)
      (at_munich d1)
      (not (munich_count_0))
      (munich_count_1))
  )

  (:action start_in_warsaw_from_0
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned d1))
      (warsaw_count_0))
    :effect (and
      (started)
      (assigned d1)
      (current_day d1)
      (at_warsaw d1)
      (not (warsaw_count_0))
      (warsaw_count_1))
  )

  (:action stay_florence_1_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (florence_count_1))
    :effect (and
      (assigned ?d2)
      (at_florence ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_count_1))
      (florence_count_2)
      (florence_done))
  )

  (:action stay_munich_1_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_munich ?d1)
      (munich_count_1))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_1))
      (munich_count_2))
  )

  (:action stay_munich_2_to_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_munich ?d1)
      (munich_count_2))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_2))
      (munich_count_3))
  )

  (:action stay_munich_3_to_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_munich ?d1)
      (munich_count_3))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_3))
      (munich_count_4))
  )

  (:action stay_munich_4_to_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_munich ?d1)
      (munich_count_4))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_4))
      (munich_count_5))
  )

  (:action stay_munich_5_to_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_munich ?d1)
      (munich_count_5))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_5))
      (munich_count_6)
      (munich_done))
  )

  (:action stay_warsaw_1_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_warsaw ?d1)
      (warsaw_count_1))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_1))
      (warsaw_count_2))
  )

  (:action stay_warsaw_2_to_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_warsaw ?d1)
      (warsaw_count_2))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_2))
      (warsaw_count_3))
  )

  (:action stay_warsaw_3_to_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_warsaw ?d1)
      (warsaw_count_3))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_3))
      (warsaw_count_4))
  )

  (:action stay_warsaw_4_to_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_warsaw ?d1)
      (warsaw_count_4))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_4))
      (warsaw_count_5))
  )

  (:action stay_warsaw_5_to_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_warsaw ?d1)
      (warsaw_count_5))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_5))
      (warsaw_count_6))
  )

  (:action stay_warsaw_6_to_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_warsaw ?d1)
      (warsaw_count_6))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_6))
      (warsaw_count_7)
      (warsaw_done))
  )

  (:action fly_florence_to_munich_1_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (munich_count_1))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_1))
      (munich_count_2))
  )

  (:action fly_florence_to_munich_2_to_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (munich_count_2))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_2))
      (munich_count_3))
  )

  (:action fly_florence_to_munich_3_to_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (munich_count_3))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_3))
      (munich_count_4))
  )

  (:action fly_florence_to_munich_4_to_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (munich_count_4))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_4))
      (munich_count_5))
  )

  (:action fly_florence_to_munich_5_to_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (munich_count_5))
    :effect (and
      (assigned ?d2)
      (at_munich ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_5))
      (munich_count_6)
      (munich_done))
  )

  (:action fly_florence_to_warsaw_1_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (warsaw_count_1))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_1))
      (warsaw_count_2))
  )

  (:action fly_florence_to_warsaw_2_to_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (warsaw_count_2))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_2))
      (warsaw_count_3))
  )

  (:action fly_florence_to_warsaw_3_to_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (warsaw_count_3))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_3))
      (warsaw_count_4))
  )

  (:action fly_florence_to_warsaw_4_to_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (warsaw_count_4))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_4))
      (warsaw_count_5))
  )

  (:action fly_florence_to_warsaw_5_to_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (warsaw_count_5))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_5))
      (warsaw_count_6))
  )

  (:action fly_florence_to_warsaw_6_to_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (not (assigned ?d2))
      (at_florence ?d1)
      (warsaw_count_6))
    :effect (and
      (assigned ?d2)
      (at_warsaw ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_6))
      (warsaw_count_7)
      (warsaw_done))
  )
)