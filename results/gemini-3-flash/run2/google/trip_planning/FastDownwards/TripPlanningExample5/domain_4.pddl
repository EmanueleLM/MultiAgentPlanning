(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?v - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?v1 ?v2 - count)
    (can_fly ?c1 ?c2 - city)
    (has_stayed ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?v_old - count ?v_new - count)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (stay_count ?c ?v_old)
      (next_count ?v_old ?v_new)
      (not (has_stayed ?c ?d))
    )
    :effect (and
      (not (stay_count ?c ?v_old))
      (stay_count ?c ?v_new)
      (has_stayed ?c ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at_city ?from)
      (current_day ?d)
      (can_fly ?from ?to)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
    )
  )

  (:action advance_day
    :parameters (?d_now - day ?d_next - day)
    :precondition (and
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
    )
    :effect (and
      (not (current_day ?d_now))
      (current_day ?d_next)
    )
  )
)