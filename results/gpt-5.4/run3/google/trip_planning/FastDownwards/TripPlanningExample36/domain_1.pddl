(define (domain trip_planning_example36)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visited ?c - city)

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
  )

  (:action start_in_florence
    :parameters ()
    :precondition (and
      (current_day day_1)
      (florence_count_0))
    :effect (and
      (at florence day_1)
      (visited florence)
      (not (florence_count_0))
      (florence_count_1))
  )

  (:action start_in_munich
    :parameters ()
    :precondition (and
      (current_day day_1)
      (munich_count_0))
    :effect (and
      (at munich day_1)
      (visited munich)
      (not (munich_count_0))
      (munich_count_1))
  )

  (:action start_in_warsaw
    :parameters ()
    :precondition (and
      (current_day day_1)
      (warsaw_count_0))
    :effect (and
      (at warsaw day_1)
      (visited warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1))
  )

  (:action stay_in_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at florence ?d1)
      (not (at florence ?d2))
      (florence_count_1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (not (florence_count_1))
      (florence_count_2))
  )

  (:action stay_in_munich_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (not (at munich ?d2))
      (munich_count_1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (not (munich_count_1))
      (munich_count_2))
  )

  (:action stay_in_munich_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (not (at munich ?d2))
      (munich_count_2))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (not (munich_count_2))
      (munich_count_3))
  )

  (:action stay_in_munich_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (not (at munich ?d2))
      (munich_count_3))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (not (munich_count_3))
      (munich_count_4))
  )

  (:action stay_in_munich_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (not (at munich ?d2))
      (munich_count_4))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (not (munich_count_4))
      (munich_count_5))
  )

  (:action stay_in_munich_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (not (at munich ?d2))
      (munich_count_5))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (not (munich_count_5))
      (munich_count_6))
  )

  (:action stay_in_warsaw_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (not (at warsaw ?d2))
      (warsaw_count_1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (not (warsaw_count_1))
      (warsaw_count_2))
  )

  (:action stay_in_warsaw_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (not (at warsaw ?d2))
      (warsaw_count_2))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (not (warsaw_count_2))
      (warsaw_count_3))
  )

  (:action stay_in_warsaw_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (not (at warsaw ?d2))
      (warsaw_count_3))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (not (warsaw_count_3))
      (warsaw_count_4))
  )

  (:action stay_in_warsaw_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (not (at warsaw ?d2))
      (warsaw_count_4))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (not (warsaw_count_4))
      (warsaw_count_5))
  )

  (:action stay_in_warsaw_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (not (at warsaw ?d2))
      (warsaw_count_5))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (not (warsaw_count_5))
      (warsaw_count_6))
  )

  (:action stay_in_warsaw_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (not (at warsaw ?d2))
      (warsaw_count_6))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (not (warsaw_count_6))
      (warsaw_count_7))
  )

  (:action fly_florence_to_munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at florence ?d1)
      (direct florence munich))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (visited munich)
      (not (munich_count_0))
      (munich_count_1))
  )

  (:action fly_florence_to_warsaw
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at florence ?d1)
      (direct florence warsaw))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (visited warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1))
  )

  (:action fly_munich_to_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (direct munich florence))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (visited florence)
      (not (florence_count_0))
      (florence_count_1))
  )

  (:action fly_munich_to_warsaw
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (direct munich warsaw))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (visited warsaw)
      (not (warsaw_count_0))
      (warsaw_count_1))
  )

  (:action fly_warsaw_to_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (direct warsaw florence))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (visited florence)
      (not (florence_count_0))
      (florence_count_1))
  )

  (:action fly_warsaw_to_munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (direct warsaw munich))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (visited munich)
      (not (munich_count_0))
      (munich_count_1))
  )
)