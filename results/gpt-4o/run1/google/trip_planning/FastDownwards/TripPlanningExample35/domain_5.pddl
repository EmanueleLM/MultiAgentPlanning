(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (in_city ?c - city)
    (current_day ?d - day)
    (next_day ?d - day ?nd - day)
    (has_visited ?c - city)
    (at_relatives)
    (scheduled_visit ?c - city ?dur - day)
    (flight_available ?from - city ?to - city)
  )
  
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (in_city ?from) (flight_available ?from ?to))
    :effect (and (not (in_city ?from)) (in_city ?to) (has_visited ?from))
  )

  (:action spend_day
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and (current_day ?d) (next_day ?d ?nd) (in_city ?c))
    :effect (and (not (current_day ?d)) (current_day ?nd))
  )

  (:action visit_relatives
    :parameters (?d - day ?nd - day)
    :precondition (and (current_day ?d) (next_day ?d ?nd) (in_city dubrovnik) (not (at_relatives)))
    :effect (and (not (current_day ?d)) (current_day ?nd) (at_relatives))
  )
)