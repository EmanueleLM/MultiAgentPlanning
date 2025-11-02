(define (domain travel-domain)
  (:requirements :strips :typing)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (daynext ?d - day ?d2 - day)
  )

  ;; Stay in the same city for the next day
  (:action stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?p ?c ?d) (daynext ?d ?d2))
    :effect (and (at ?p ?c ?d2))
  )

  ;; Fly using a direct flight from one city to another, taking one day (from day d to day d2).
  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?p ?from ?d) (daynext ?d ?d2) (direct ?from ?to))
    :effect (and (at ?p ?to ?d2))
  )
)