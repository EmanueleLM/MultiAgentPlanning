(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (visit_day ?c - city ?d - day)

    (wedding_window ?d - day)
    (wedding_attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d2)
    )
    :effect (and
      (visit_day ?c ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (current_day ?d)
      (next_day ?d ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visit_day ?to ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_last_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (last_day ?d)
    )
    :effect (and
      (visit_day ?c ?d)
      (not (current_day ?d))
    )
  )

  (:action fly_last_day
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (current_day ?d)
      (last_day ?d)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visit_day ?to ?d)
      (not (current_day ?d))
    )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (at venice)
      (current_day ?d)
      (wedding_window ?d)
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )
)