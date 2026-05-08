(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (at ?c - city ?d - day)
    (assigned ?d - day)
    (trip_finished)

    (direct_flight ?from - city ?to - city)

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

  (:action initialize_start_in_florence
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (florence_count_0)
    )
    :effect (and
      (at florence day1)
      (assigned day1)
      (not (florence_count_0))
      (florence_count_1)
    )
  )

  (:action initialize_start_in_munich
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (munich_count_0)
    )
    :effect (and
      (at munich day1)
      (assigned day1)
      (not (munich_count_0))
      (munich_count_1)
    )
  )

  (:action initialize_start_in_warsaw
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (assigned day1))
      (warsaw_count_0)
    )
    :effect (and
      (at warsaw day1)
      (assigned day1)
      (not (warsaw_count_0))
      (warsaw_count_1)
    )
  )

  (:action stay_florence_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at florence ?d1)
      (not (assigned ?d2))
      (florence_count_1)
    )
    :effect (and
      (at florence ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action stay_munich_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at munich ?d1)
      (not (assigned ?d2))
      (munich_count_1)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_1))
      (munich_count_2)
    )
  )

  (:action stay_munich_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at munich ?d1)
      (not (assigned ?d2))
      (munich_count_2)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_2))
      (munich_count_3)
    )
  )

  (:action stay_munich_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at munich ?d1)
      (not (assigned ?d2))
      (munich_count_3)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_3))
      (munich_count_4)
    )
  )

  (:action stay_munich_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at munich ?d1)
      (not (assigned ?d2))
      (munich_count_4)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_4))
      (munich_count_5)
    )
  )

  (:action stay_munich_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at munich ?d1)
      (not (assigned ?d2))
      (munich_count_5)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_5))
      (munich_count_6)
    )
  )

  (:action stay_warsaw_1_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at warsaw ?d1)
      (not (assigned ?d2))
      (warsaw_count_1)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action stay_warsaw_2_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at warsaw ?d1)
      (not (assigned ?d2))
      (warsaw_count_2)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action stay_warsaw_3_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at warsaw ?d1)
      (not (assigned ?d2))
      (warsaw_count_3)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_3))
      (warsaw_count_4)
    )
  )

  (:action stay_warsaw_4_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at warsaw ?d1)
      (not (assigned ?d2))
      (warsaw_count_4)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_4))
      (warsaw_count_5)
    )
  )

  (:action stay_warsaw_5_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at warsaw ?d1)
      (not (assigned ?d2))
      (warsaw_count_5)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_5))
      (warsaw_count_6)
    )
  )

  (:action stay_warsaw_6_7
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at warsaw ?d1)
      (not (assigned ?d2))
      (warsaw_count_6)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_6))
      (warsaw_count_7)
    )
  )

  (:action fly_to_florence_1_2
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from florence)
      (not (= ?from florence))
      (not (assigned ?d2))
      (florence_count_1)
    )
    :effect (and
      (at florence ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_count_1))
      (florence_count_2)
    )
  )

  (:action fly_to_munich_1_2
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from munich)
      (not (= ?from munich))
      (not (assigned ?d2))
      (munich_count_1)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_1))
      (munich_count_2)
    )
  )

  (:action fly_to_munich_2_3
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from munich)
      (not (= ?from munich))
      (not (assigned ?d2))
      (munich_count_2)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_2))
      (munich_count_3)
    )
  )

  (:action fly_to_munich_3_4
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from munich)
      (not (= ?from munich))
      (not (assigned ?d2))
      (munich_count_3)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_3))
      (munich_count_4)
    )
  )

  (:action fly_to_munich_4_5
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from munich)
      (not (= ?from munich))
      (not (assigned ?d2))
      (munich_count_4)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_4))
      (munich_count_5)
    )
  )

  (:action fly_to_munich_5_6
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from munich)
      (not (= ?from munich))
      (not (assigned ?d2))
      (munich_count_5)
    )
    :effect (and
      (at munich ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (munich_count_5))
      (munich_count_6)
    )
  )

  (:action fly_to_warsaw_1_2
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from warsaw)
      (not (= ?from warsaw))
      (not (assigned ?d2))
      (warsaw_count_1)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_1))
      (warsaw_count_2)
    )
  )

  (:action fly_to_warsaw_2_3
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from warsaw)
      (not (= ?from warsaw))
      (not (assigned ?d2))
      (warsaw_count_2)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_2))
      (warsaw_count_3)
    )
  )

  (:action fly_to_warsaw_3_4
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from warsaw)
      (not (= ?from warsaw))
      (not (assigned ?d2))
      (warsaw_count_3)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_3))
      (warsaw_count_4)
    )
  )

  (:action fly_to_warsaw_4_5
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from warsaw)
      (not (= ?from warsaw))
      (not (assigned ?d2))
      (warsaw_count_4)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_4))
      (warsaw_count_5)
    )
  )

  (:action fly_to_warsaw_5_6
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from warsaw)
      (not (= ?from warsaw))
      (not (assigned ?d2))
      (warsaw_count_5)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_5))
      (warsaw_count_6)
    )
  )

  (:action fly_to_warsaw_6_7
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from warsaw)
      (not (= ?from warsaw))
      (not (assigned ?d2))
      (warsaw_count_6)
    )
    :effect (and
      (at warsaw ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (warsaw_count_6))
      (warsaw_count_7)
    )
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (current_day day13)
      (last_day day13)
      (assigned day13)
      (not (trip_finished))
      (florence_count_2)
      (munich_count_6)
      (warsaw_count_7)
    )
    :effect (and
      (trip_finished)
    )
  )
)