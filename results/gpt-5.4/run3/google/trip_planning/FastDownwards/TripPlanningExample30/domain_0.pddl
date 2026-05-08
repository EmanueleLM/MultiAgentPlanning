(define (domain european_trip_14day_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (assigned ?d - day ?c - city)
    (current_day ?d - day)
    (last_day ?d - day)
    (schedule_complete)
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1 ?c)
      (not (assigned ?d2 istanbul))
      (not (assigned ?d2 tallinn))
      (not (assigned ?d2 zurich))
    )
    :effect (and
      (assigned ?d2 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1 ?from)
      (direct ?from ?to)
      (not (assigned ?d2 istanbul))
      (not (assigned ?d2 tallinn))
      (not (assigned ?d2 zurich))
    )
    :effect (and
      (assigned ?d2 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action finish_schedule
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
    )
    :effect (and
      (schedule_complete)
    )
  )
)