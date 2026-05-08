(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates 
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (flight_available ?from - city ?to - city)
    (conference_in_stockholm ?d - day)
  )
  
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (flight_available ?from ?to) (next_day ?d1 ?d2))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )
)