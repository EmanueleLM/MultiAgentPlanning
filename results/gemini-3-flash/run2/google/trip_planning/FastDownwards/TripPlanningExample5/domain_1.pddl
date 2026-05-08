(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (count ?c - city ?v - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?v1 ?v2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  (:action spend_day
    :parameters (?c - city ?d - day ?v_old - count ?v_new - count)
    :precondition (and 
      (current_day ?d)
      (at_city ?c)
      (not (visited ?c ?d))
      (count ?c ?v_old)
      (next_count ?v_old ?v_new)
    )
    :effect (and 
      (visited ?c ?d)
      (not (count ?c ?v_old))
      (count ?c ?v_new)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and 
      (current_day ?d)
      (at_city ?from)
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