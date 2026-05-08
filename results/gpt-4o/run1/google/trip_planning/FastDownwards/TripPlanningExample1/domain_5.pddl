(define (domain travel_schedule)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?city - city ?day - day)
    (can_fly ?from - city ?to - city)
    (next_day ?day1 - day ?day2 - day)
    (visited ?city - city)
  )

  (:action fly
    :parameters (?from - city ?to - city ?start_day - day ?arrival_day - day)
    :precondition (and
      (at ?from ?start_day)
      (can_fly ?from ?to)
      (next_day ?start_day ?arrival_day))
    :effect (and
      (not (at ?from ?start_day))
      (at ?to ?arrival_day)
      (visited ?to)
    )
  )

  (:action stay
    :parameters (?city - city ?start_day - day ?next_day - day)
    :precondition (and
      (at ?city ?start_day)
      (next_day ?start_day ?next_day))
    :effect (and
      (not (at ?city ?start_day))
      (at ?city ?next_day)
    )
  )
)