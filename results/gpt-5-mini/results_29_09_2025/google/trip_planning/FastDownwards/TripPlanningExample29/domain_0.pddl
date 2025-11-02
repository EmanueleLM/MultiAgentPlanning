(define (domain travel-multiagent)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (free ?d - day)
    (flightexists ?from - city ?to - city)
    (next ?d - day ?nd - day)
  )

  ;; Stay in the same city from day d to next day nd
  (:action traveler-stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and (at ?c ?d) (next ?d ?nd) (free ?nd))
    :effect (and (at ?c ?nd) (not (free ?nd)))
  )

  ;; Fly from one city to another (requires a direct flight) between day d and next day nd
  (:action traveler-fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and (at ?from ?d) (flightexists ?from ?to) (next ?d ?nd) (free ?nd))
    :effect (and (at ?to ?nd) (not (free ?nd)))
  )
)