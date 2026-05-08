(define (domain trip_planning_example27)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (day_in_city ?d - day ?c - city)
    (visited_relatives)
    (relatives_window ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (day_in_city ?d2 amsterdam))
      (not (day_in_city ?d2 istanbul))
      (not (day_in_city ?d2 santorini))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (day_in_city ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (day_in_city ?d2 amsterdam))
      (not (day_in_city ?d2 istanbul))
      (not (day_in_city ?d2 santorini))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (day_in_city ?d2 ?to)
    )
  )

  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at santorini)
      (day_in_city ?d santorini)
      (relatives_window ?d)
      (not (visited_relatives))
    )
    :effect (visited_relatives)
  )
)