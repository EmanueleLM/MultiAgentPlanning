(define (domain european_trip)
  (:requirements :strips :typing)
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
    :parameters (?from - city ?to - city ?day - day ?next - day)
    :precondition (and (at ?from ?day)
                       (flight_available ?from ?to)
                       (next_day ?day ?next))
    :effect (and (not (at ?from ?day))
                 (at ?to ?next)
                 (visited ?to))
  )

  (:action stay
    :parameters (?city - city ?day - day ?next - day)
    :precondition (and (at ?city ?day)
                       (next_day ?day ?next)
                       (not (conference_day ?day)))
    :effect (and (not (at ?city ?day))
                 (at ?city ?next))
  )
)