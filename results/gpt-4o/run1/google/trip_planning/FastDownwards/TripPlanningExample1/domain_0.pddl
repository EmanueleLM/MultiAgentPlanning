(define (domain travel_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?city - city ?day - day)
    (can_fly ?from - city ?to - city)
    (successor ?day1 - day ?day2 - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?start_day - day ?end_day - day)
    :precondition (and
      (at ?from ?start_day)
      (can_fly ?from ?to)
      (successor ?start_day ?end_day))
    :effect (and
      (not (at ?from ?start_day))
      (at ?to ?end_day)
    )
  )

  (:action stay
    :parameters (?city - city ?start_day - day ?end_day - day)
    :precondition (and
      (at ?city ?start_day)
      (successor ?start_day ?end_day))
    :effect (and
      (not (at ?city ?start_day))
      (at ?city ?end_day)
    )
  )
)