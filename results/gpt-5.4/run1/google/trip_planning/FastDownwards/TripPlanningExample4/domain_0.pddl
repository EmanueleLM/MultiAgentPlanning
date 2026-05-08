(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (unstarted)
    (met_friend)

    (need_seville_1)
    (need_seville_2)
    (need_seville_3)
    (need_seville_4)
    (need_seville_5)
    (need_seville_6)
    (need_seville_7)
    (done_seville_1)
    (done_seville_2)
    (done_seville_3)
    (done_seville_4)
    (done_seville_5)
    (done_seville_6)
    (done_seville_7)

    (need_munich_1)
    (need_munich_2)
    (need_munich_3)
    (need_munich_4)
    (need_munich_5)
    (done_munich_1)
    (done_munich_2)
    (done_munich_3)
    (done_munich_4)
    (done_munich_5)

    (need_tallinn_1)
    (need_tallinn_2)
    (done_tallinn_1)
    (done_tallinn_2)
  )

  (:action start_in_seville
    :precondition (and
      (unstarted)
      (current_day day_1)
      (need_seville_1)
    )
    :effect (and
      (not (unstarted))
      (at seville)
      (not (need_seville_1))
      (done_seville_1)
    )
  )

  (:action start_in_munich
    :precondition (and
      (unstarted)
      (current_day day_1)
      (need_munich_1)
    )
    :effect (and
      (not (unstarted))
      (at munich)
      (not (need_munich_1))
      (done_munich_1)
    )
  )

  (:action start_in_tallinn
    :precondition (and
      (unstarted)
      (current_day day_1)
      (need_tallinn_1)
    )
    :effect (and
      (not (unstarted))
      (at tallinn)
      (not (need_tallinn_1))
      (done_tallinn_1)
    )
  )

  (:action stay_seville_use_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_seville_1)
      (need_seville_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_2))
      (done_seville_2)
    )
  )

  (:action stay_seville_use_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_seville_2)
      (need_seville_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_3))
      (done_seville_3)
    )
  )

  (:action stay_seville_use_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_seville_3)
      (need_seville_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_4))
      (done_seville_4)
    )
  )

  (:action stay_seville_use_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_seville_4)
      (need_seville_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_5))
      (done_seville_5)
    )
  )

  (:action stay_seville_use_6
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_seville_5)
      (need_seville_6)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_6))
      (done_seville_6)
    )
  )

  (:action stay_seville_use_7
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_seville_6)
      (need_seville_7)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_7))
      (done_seville_7)
    )
  )

  (:action stay_munich_use_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_munich_1)
      (need_munich_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_2))
      (done_munich_2)
    )
  )

  (:action stay_munich_use_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_munich_2)
      (need_munich_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_3))
      (done_munich_3)
    )
  )

  (:action stay_munich_use_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_munich_3)
      (need_munich_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_4))
      (done_munich_4)
    )
  )

  (:action stay_munich_use_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_munich_4)
      (need_munich_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_5))
      (done_munich_5)
    )
  )

  (:action stay_tallinn_use_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (next_day ?d ?dnext)
      (done_tallinn_1)
      (need_tallinn_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_tallinn_2))
      (done_tallinn_2)
    )
  )

  (:action stay_tallinn_use_2_meet
    :parameters ()
    :precondition (and
      (at tallinn)
      (current_day day_10)
      (next_day day_10 day_11)
      (done_tallinn_1)
      (need_tallinn_2)
    )
    :effect (and
      (not (current_day day_10))
      (current_day day_11)
      (not (need_tallinn_2))
      (done_tallinn_2)
      (met_friend)
    )
  )

  (:action fly_seville_to_munich_use_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct seville munich)
      (done_munich_1)
      (need_munich_2)
    )
    :effect (and
      (not (at seville))
      (at munich)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_2))
      (done_munich_2)
    )
  )

  (:action fly_seville_to_munich_use_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct seville munich)
      (done_munich_2)
      (need_munich_3)
    )
    :effect (and
      (not (at seville))
      (at munich)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_3))
      (done_munich_3)
    )
  )

  (:action fly_seville_to_munich_use_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct seville munich)
      (done_munich_3)
      (need_munich_4)
    )
    :effect (and
      (not (at seville))
      (at munich)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_4))
      (done_munich_4)
    )
  )

  (:action fly_seville_to_munich_use_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at seville)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct seville munich)
      (done_munich_4)
      (need_munich_5)
    )
    :effect (and
      (not (at seville))
      (at munich)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_5))
      (done_munich_5)
    )
  )

  (:action fly_munich_to_seville_use_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct munich seville)
      (done_seville_1)
      (need_seville_2)
    )
    :effect (and
      (not (at munich))
      (at seville)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_2))
      (done_seville_2)
    )
  )

  (:action fly_munich_to_seville_use_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct munich seville)
      (done_seville_2)
      (need_seville_3)
    )
    :effect (and
      (not (at munich))
      (at seville)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_3))
      (done_seville_3)
    )
  )

  (:action fly_munich_to_seville_use_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct munich seville)
      (done_seville_3)
      (need_seville_4)
    )
    :effect (and
      (not (at munich))
      (at seville)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_4))
      (done_seville_4)
    )
  )

  (:action fly_munich_to_seville_use_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct munich seville)
      (done_seville_4)
      (need_seville_5)
    )
    :effect (and
      (not (at munich))
      (at seville)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_5))
      (done_seville_5)
    )
  )

  (:action fly_munich_to_seville_use_6
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct munich seville)
      (done_seville_5)
      (need_seville_6)
    )
    :effect (and
      (not (at munich))
      (at seville)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_6))
      (done_seville_6)
    )
  )

  (:action fly_munich_to_seville_use_7
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct munich seville)
      (done_seville_6)
      (need_seville_7)
    )
    :effect (and
      (not (at munich))
      (at seville)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_seville_7))
      (done_seville_7)
    )
  )

  (:action fly_munich_to_tallinn_use_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at munich)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct munich tallinn)
      (done_tallinn_1)
      (need_tallinn_2)
    )
    :effect (and
      (not (at munich))
      (at tallinn)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_tallinn_2))
      (done_tallinn_2)
    )
  )

  (:action fly_munich_to_tallinn_use_2_meet
    :parameters ()
    :precondition (and
      (at munich)
      (current_day day_10)
      (next_day day_10 day_11)
      (direct munich tallinn)
      (done_tallinn_1)
      (need_tallinn_2)
    )
    :effect (and
      (not (at munich))
      (at tallinn)
      (not (current_day day_10))
      (current_day day_11)
      (not (need_tallinn_2))
      (done_tallinn_2)
      (met_friend)
    )
  )

  (:action fly_tallinn_to_munich_use_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct tallinn munich)
      (done_munich_1)
      (need_munich_2)
    )
    :effect (and
      (not (at tallinn))
      (at munich)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_2))
      (done_munich_2)
    )
  )

  (:action fly_tallinn_to_munich_use_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct tallinn munich)
      (done_munich_2)
      (need_munich_3)
    )
    :effect (and
      (not (at tallinn))
      (at munich)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_3))
      (done_munich_3)
    )
  )

  (:action fly_tallinn_to_munich_use_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct tallinn munich)
      (done_munich_3)
      (need_munich_4)
    )
    :effect (and
      (not (at tallinn))
      (at munich)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_4))
      (done_munich_4)
    )
  )

  (:action fly_tallinn_to_munich_use_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct tallinn munich)
      (done_munich_4)
      (need_munich_5)
    )
    :effect (and
      (not (at tallinn))
      (at munich)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (need_munich_5))
      (done_munich_5)
    )
  )

  (:action meet_friend_on_day_11
    :precondition (and
      (at tallinn)
      (current_day day_11)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )

  (:action meet_friend_on_day_12
    :precondition (and
      (at tallinn)
      (current_day day_12)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )
)