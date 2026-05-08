(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?v - count)
    (stayed_at_day ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?v1 ?v2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  ;; Records that the traveler spent part or all of the current day in a city.
  (:action record_stay
    :parameters (?c - city ?d - day ?v_old ?v_new - count)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (stay_count ?c ?v_old)
      (next_count ?v_old ?v_new)
      (not (stayed_at_day ?c ?d))
    )
    :effect (and
      (not (stay_count ?c ?v_old))
      (stay_count ?c ?v_new)
      (stayed_at_day ?c ?d)
    )
  )

  ;; Moves the traveler from one city to another using a direct flight on the current day.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day)
    :precondition (and
      (at_city ?c_from)
      (can_fly ?c_from ?c_to)
      (current_day ?d)
    )
    :effect (and
      (not (at_city ?c_from))
      (at_city ?c_to)
    )
  )

  ;; Advances the current day to the next day in the sequence.
  (:action advance_day
    :parameters (?d_old - day ?d_new - day)
    :precondition (and
      (current_day ?d_old)
      (next_day ?d_old ?d_new)
    )
    :effect (and
      (not (current_day ?d_old))
      (current_day ?d_new)
    )
  )
)