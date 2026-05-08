(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (current_city ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (attended_conference ?d - day)
    (flight_exists ?from - city ?to - city)
  )
  (:action travel
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?from ?d1)
      (next_day ?d1 ?d2)
      (flight_exists ?from ?to)
    )
    :effect (and
      (not (current_city ?from ?d2))
      (current_city ?to ?d2)
    )
  )
  (:action attend_conference
    :parameters (?d - day)
    :precondition (and
      (current_city paris ?d)
    )
    :effect (attended_conference ?d)
  )
)