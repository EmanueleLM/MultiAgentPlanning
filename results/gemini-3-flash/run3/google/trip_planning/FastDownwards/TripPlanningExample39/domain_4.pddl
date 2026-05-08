(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:constants
    porto barcelona florence - city
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (day_spent ?c - city ?d - day)
    (spent_count ?c - city ?n - count)
    (relatives_visited)
    (can_fly ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (is_relative_day ?d - day)
  )

  ;; Stay in the current city on the current day, incrementing the city's count.
  ;; This model allows staying in two different cities on the same day if a flight occurs.
  (:action stay
    :parameters (?c - city ?d - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (spent_count ?c ?n)
      (next_count ?n ?nn)
      (not (day_spent ?c ?d))
    )
    :effect (and
      (day_spent ?c ?d)
      (not (spent_count ?c ?n))
      (spent_count ?c ?nn)
    )
  )

  ;; Move between cities. This does not advance the day, allowing a shared travel day.
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

  ;; Move to the next day in the timeline.
  (:action advance_day
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  ;; Special task to visit relatives in Porto on a valid relative day.
  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and
      (at_city porto)
      (current_day ?d)
      (is_relative_day ?d)
    )
    :effect (and
      (relatives_visited)
    )
  )
)