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
    (visited_day ?c - city ?d - day)
    (in_relatives_window ?d - day)
    (relatives_visited)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited_day amsterdam ?d2))
      (not (visited_day istanbul ?d2))
      (not (visited_day santorini ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited_day amsterdam ?d2))
      (not (visited_day istanbul ?d2))
      (not (visited_day santorini ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?to ?d2)
    )
  )

  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at santorini)
      (visited_day santorini ?d)
      (in_relatives_window ?d)
      (not (relatives_visited))
    )
    :effect (relatives_visited)
  )
)