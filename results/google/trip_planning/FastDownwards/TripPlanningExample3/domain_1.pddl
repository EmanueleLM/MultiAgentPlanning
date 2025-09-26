(define (domain travel-multiagent)
  (:requirements :strips :typing)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (leg ?from - city ?to - city)
  )

  (:action stay_traveler
    :parameters (?a - agent ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?c ?d) (next ?d ?d2))
    :effect (and (at ?a ?c ?d2))
  )

  (:action fly_flight_service
    :parameters (?a - agent ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?from ?d) (leg ?from ?to) (next ?d ?d2))
    :effect (and (at ?a ?to ?d2))
  )
)