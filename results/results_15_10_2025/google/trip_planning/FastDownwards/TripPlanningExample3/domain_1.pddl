(define (domain travel-multi-agent)
  (:requirements :typing)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
  )

  (:action traveler-stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?p ?c ?d2))
  )

  (:action flight_service-fly
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at ?p ?to ?d2))
  )
)