(define (domain european_trip_15_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (meeting_window_day ?d - day)
    (spent_day_in ?c - city ?d - day)
    (met_friend)
    (start_not_chosen)

    (valencia_day_counted ?d - day)
    (amsterdam_day_counted ?d - day)
    (tallinn_day_counted ?d - day)

    (valencia_slot_1_filled)
    (valencia_slot_2_filled)
    (valencia_slot_3_filled)
    (valencia_slot_4_filled)
    (valencia_slot_5_filled)

    (amsterdam_slot_1_filled)
    (amsterdam_slot_2_filled)
    (amsterdam_slot_3_filled)
    (amsterdam_slot_4_filled)
    (amsterdam_slot_5_filled)

    (tallinn_slot_1_filled)
    (tallinn_slot_2_filled)
    (tallinn_slot_3_filled)
    (tallinn_slot_4_filled)
    (tallinn_slot_5_filled)
    (tallinn_slot_6_filled)
    (tallinn_slot_7_filled)
  )

  (:action choose_start_valencia
    :parameters ()
    :precondition (and
      (start_not_chosen)
      (current_day day_1)
      (not (at valencia))
      (not (at amsterdam))
      (not (at tallinn))
    )
    :effect (and
      (at valencia)
      (not (start_not_chosen))
    )
  )

  (:action choose_start_amsterdam
    :parameters ()
    :precondition (and
      (start_not_chosen)
      (current_day day_1)
      (not (at valencia))
      (not (at amsterdam))
      (not (at tallinn))
    )
    :effect (and
      (at amsterdam)
      (not (start_not_chosen))
    )
  )

  (:action choose_start_tallinn
    :parameters ()
    :precondition (and
      (start_not_chosen)
      (current_day day_1)
      (not (at valencia))
      (not (at amsterdam))
      (not (at tallinn))
    )
    :effect (and
      (at tallinn)
      (not (start_not_chosen))
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct_flight ?from ?to)
      (not (start_not_chosen))
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_day_valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at valencia)
      (not (start_not_chosen))
      (not (spent_day_in valencia ?d1))
      (not (spent_day_in amsterdam ?d1))
      (not (spent_day_in tallinn ?d1))
      (not (valencia_day_counted ?d1))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in valencia ?d1)
      (valencia_day_counted ?d1)
    )
  )

  (:action stay_day_amsterdam
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at amsterdam)
      (not (start_not_chosen))
      (not (spent_day_in valencia ?d1))
      (not (spent_day_in amsterdam ?d1))
      (not (spent_day_in tallinn ?d1))
      (not (amsterdam_day_counted ?d1))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in amsterdam ?d1)
      (amsterdam_day_counted ?d1)
    )
  )

  (:action stay_day_tallinn_window
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at tallinn)
      (meeting_window_day ?d1)
      (not (start_not_chosen))
      (not (spent_day_in valencia ?d1))
      (not (spent_day_in amsterdam ?d1))
      (not (spent_day_in tallinn ?d1))
      (not (tallinn_day_counted ?d1))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in tallinn ?d1)
      (tallinn_day_counted ?d1)
      (met_friend)
    )
  )

  (:action stay_day_tallinn_nonwindow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at tallinn)
      (not (meeting_window_day ?d1))
      (not (start_not_chosen))
      (not (spent_day_in valencia ?d1))
      (not (spent_day_in amsterdam ?d1))
      (not (spent_day_in tallinn ?d1))
      (not (tallinn_day_counted ?d1))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in tallinn ?d1)
      (tallinn_day_counted ?d1)
    )
  )

  (:action fill_valencia_slot_1
    :parameters (?d - day)
    :precondition (and
      (valencia_day_counted ?d)
      (not (valencia_slot_1_filled))
    )
    :effect (and
      (valencia_slot_1_filled)
    )
  )

  (:action fill_valencia_slot_2
    :parameters (?d - day)
    :precondition (and
      (valencia_day_counted ?d)
      (valencia_slot_1_filled)
      (not (valencia_slot_2_filled))
    )
    :effect (and
      (valencia_slot_2_filled)
    )
  )

  (:action fill_valencia_slot_3
    :parameters (?d - day)
    :precondition (and
      (valencia_day_counted ?d)
      (valencia_slot_2_filled)
      (not (valencia_slot_3_filled))
    )
    :effect (and
      (valencia_slot_3_filled)
    )
  )

  (:action fill_valencia_slot_4
    :parameters (?d - day)
    :precondition (and
      (valencia_day_counted ?d)
      (valencia_slot_3_filled)
      (not (valencia_slot_4_filled))
    )
    :effect (and
      (valencia_slot_4_filled)
    )
  )

  (:action fill_valencia_slot_5
    :parameters (?d - day)
    :precondition (and
      (valencia_day_counted ?d)
      (valencia_slot_4_filled)
      (not (valencia_slot_5_filled))
    )
    :effect (and
      (valencia_slot_5_filled)
    )
  )

  (:action fill_amsterdam_slot_1
    :parameters (?d - day)
    :precondition (and
      (amsterdam_day_counted ?d)
      (not (amsterdam_slot_1_filled))
    )
    :effect (and
      (amsterdam_slot_1_filled)
    )
  )

  (:action fill_amsterdam_slot_2
    :parameters (?d - day)
    :precondition (and
      (amsterdam_day_counted ?d)
      (amsterdam_slot_1_filled)
      (not (amsterdam_slot_2_filled))
    )
    :effect (and
      (amsterdam_slot_2_filled)
    )
  )

  (:action fill_amsterdam_slot_3
    :parameters (?d - day)
    :precondition (and
      (amsterdam_day_counted ?d)
      (amsterdam_slot_2_filled)
      (not (amsterdam_slot_3_filled))
    )
    :effect (and
      (amsterdam_slot_3_filled)
    )
  )

  (:action fill_amsterdam_slot_4
    :parameters (?d - day)
    :precondition (and
      (amsterdam_day_counted ?d)
      (amsterdam_slot_3_filled)
      (not (amsterdam_slot_4_filled))
    )
    :effect (and
      (amsterdam_slot_4_filled)
    )
  )

  (:action fill_amsterdam_slot_5
    :parameters (?d - day)
    :precondition (and
      (amsterdam_day_counted ?d)
      (amsterdam_slot_4_filled)
      (not (amsterdam_slot_5_filled))
    )
    :effect (and
      (amsterdam_slot_5_filled)
    )
  )

  (:action fill_tallinn_slot_1
    :parameters (?d - day)
    :precondition (and
      (tallinn_day_counted ?d)
      (not (tallinn_slot_1_filled))
    )
    :effect (and
      (tallinn_slot_1_filled)
    )
  )

  (:action fill_tallinn_slot_2
    :parameters (?d - day)
    :precondition (and
      (tallinn_day_counted ?d)
      (tallinn_slot_1_filled)
      (not (tallinn_slot_2_filled))
    )
    :effect (and
      (tallinn_slot_2_filled)
    )
  )

  (:action fill_tallinn_slot_3
    :parameters (?d - day)
    :precondition (and
      (tallinn_day_counted ?d)
      (tallinn_slot_2_filled)
      (not (tallinn_slot_3_filled))
    )
    :effect (and
      (tallinn_slot_3_filled)
    )
  )

  (:action fill_tallinn_slot_4
    :parameters (?d - day)
    :precondition (and
      (tallinn_day_counted ?d)
      (tallinn_slot_3_filled)
      (not (tallinn_slot_4_filled))
    )
    :effect (and
      (tallinn_slot_4_filled)
    )
  )

  (:action fill_tallinn_slot_5
    :parameters (?d - day)
    :precondition (and
      (tallinn_day_counted ?d)
      (tallinn_slot_4_filled)
      (not (tallinn_slot_5_filled))
    )
    :effect (and
      (tallinn_slot_5_filled)
    )
  )

  (:action fill_tallinn_slot_6
    :parameters (?d - day)
    :precondition (and
      (tallinn_day_counted ?d)
      (tallinn_slot_5_filled)
      (not (tallinn_slot_6_filled))
    )
    :effect (and
      (tallinn_slot_6_filled)
    )
  )

  (:action fill_tallinn_slot_7
    :parameters (?d - day)
    :precondition (and
      (tallinn_day_counted ?d)
      (tallinn_slot_6_filled)
      (not (tallinn_slot_7_filled))
    )
    :effect (and
      (tallinn_slot_7_filled)
    )
  )
)