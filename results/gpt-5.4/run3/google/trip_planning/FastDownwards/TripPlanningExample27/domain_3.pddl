(define (domain trip_planning_example27)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (occupied ?c - city ?d - day)
    (goal_day ?d - day)
    (relative_window ?d - day)
    (relatives_visited)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (goal_day ?d1))
      (not (occupied amsterdam ?d2))
      (not (occupied istanbul ?d2))
      (not (occupied santorini ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (goal_day ?d1))
      (not (occupied amsterdam ?d2))
      (not (occupied istanbul ?d2))
      (not (occupied santorini ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?to ?d2)
    )
  )

  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at santorini)
      (occupied santorini ?d)
      (relative_window ?d)
      (not (relatives_visited))
    )
    :effect (relatives_visited)
  )
)