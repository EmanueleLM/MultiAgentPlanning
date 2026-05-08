(define (domain european_trip_12day_instance)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (spent ?c - city ?d - day)
    (visit_window_day ?d - day)
    (visited_relatives)
  )

  (:action stay_day
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?c)
    )
    :effect (and
      (spent ?c ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_day
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (spent ?to ?d)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_porto_visit_relatives
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at porto)
      (visit_window_day ?d)
    )
    :effect (and
      (spent porto ?d)
      (visited_relatives)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )
)