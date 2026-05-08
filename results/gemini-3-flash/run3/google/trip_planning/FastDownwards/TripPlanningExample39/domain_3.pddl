(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (spent_count ?c - city ?n - count)
    (relatives_visited)
    (can_fly ?from - city ?to - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (is_valid_relative_day ?d - day)
  )

  (:action spend_day
    :parameters (?c - city ?d - day ?nd - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (spent_count ?c ?n)
      (next_count ?n ?nn)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (spent_count ?c ?n))
      (spent_count ?c ?nn)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at_city ?from)
      (can_fly ?from ?to)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
    )
  )

  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and
      (at_city porto)
      (current_day ?d)
      (is_valid_relative_day ?d)
    )
    :effect (relatives_visited)
  )
)