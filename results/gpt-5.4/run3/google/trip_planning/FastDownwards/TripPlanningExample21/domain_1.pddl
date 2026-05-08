(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (current_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (workshop_day ?d - day)

    (visited ?c - city ?d - day)
    (workshop_attended)

    (trip_started)
    (trip_finished)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (trip_started))
    )
    :effect (and
      (trip_started)
      (current_city ?c)
      (visited ?c day1)
    )
  )

  (:action stay_for_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_city ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (visited ?c ?d1)
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?c ?d2)
    )
  )

  (:action fly_for_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (trip_started)
      (current_city ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (visited ?from ?d1)
      (direct_flight ?from ?to)
      (not (trip_finished))
      (not (current_city ?to))
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?to ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (trip_started)
      (current_day ?d)
      (current_city venice)
      (visited venice ?d)
      (workshop_day ?d)
      (not (workshop_attended))
    )
    :effect (and
      (workshop_attended)
    )
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (trip_started)
      (current_day day10)
      (not (trip_finished))
    )
    :effect (and
      (trip_finished)
    )
  )
)