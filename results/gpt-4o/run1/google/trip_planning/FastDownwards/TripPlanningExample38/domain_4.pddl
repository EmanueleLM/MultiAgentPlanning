(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (flight_available ?from - city ?to - city)
    (conference_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited ?c - city)
    (planned ?c - city ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1)
                       (flight_available ?from ?to)
                       (next_day ?d1 ?d2)
                       (not (conference_day ?d1)))
    :effect (and (not (at ?from ?d1))
                 (at ?to ?d2)
                 (visited ?to))
  )

  (:action stay
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and (at ?city ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at ?city ?d1)) (at ?city ?d2))
  )
)