(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (current_day ?d - day)
    (at ?c - city)
    (occupied ?d - day ?c - city)
    (finished)

    (count_city ?c - city ?n - count)
    (next_count ?n1 - count ?n2 - count)

    (met_friend_window)
  )

  (:action stay_and_advance
    :parameters (?d - day ?d_next - day ?c - city ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c)
      (count_city ?c ?n1)
      (next_count ?n1 ?n2)
      (not (occupied ?d seville))
      (not (occupied ?d munich))
      (not (occupied ?d tallinn))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (count_city ?c ?n1))
      (count_city ?c ?n2)
    )
  )

  (:action fly_and_advance
    :parameters (?d - day ?d_next - day ?from - city ?to - city ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct ?from ?to)
      (count_city ?from ?n1)
      (next_count ?n1 ?n2)
      (not (occupied ?d seville))
      (not (occupied ?d munich))
      (not (occupied ?d tallinn))
    )
    :effect (and
      (occupied ?d ?from)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at ?to)
      (not (count_city ?from ?n1))
      (count_city ?from ?n2)
    )
  )

  (:action finish_last_day
    :parameters (?d - day ?c - city ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (count_city ?c ?n1)
      (next_count ?n1 ?n2)
      (not (occupied ?d seville))
      (not (occupied ?d munich))
      (not (occupied ?d tallinn))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current_day ?d))
      (finished)
      (not (count_city ?c ?n1))
      (count_city ?c ?n2)
    )
  )

  (:action mark_friend_day_11
    :parameters ()
    :precondition (and
      (occupied day_11 tallinn)
      (not (met_friend_window))
    )
    :effect (and
      (met_friend_window)
    )
  )

  (:action mark_friend_day_12
    :parameters ()
    :precondition (and
      (occupied day_12 tallinn)
      (not (met_friend_window))
    )
    :effect (and
      (met_friend_window)
    )
  )
)