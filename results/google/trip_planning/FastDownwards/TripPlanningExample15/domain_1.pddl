(define (domain travel-domain)
  (:requirements :strips :typing)
  (:types agent city day)
  (:predicates
    (at ?p - agent ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (succ ?d1 - day ?d2 - day)
  )

  (:action stay_traveler
    :parameters (?p - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?c ?d1) (succ ?d1 ?d2))
    :effect (and (not (at ?p ?c ?d1)) (at ?p ?c ?d2))
  )

  (:action fly_same_day_traveler
    :parameters (?p - agent ?from - city ?to - city ?d - day)
    :precondition (and (at ?p ?from ?d) (direct ?from ?to))
    :effect (and (not (at ?p ?from ?d)) (at ?p ?to ?d))
  )

  (:action fly_next_day_traveler
    :parameters (?p - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?from ?d1) (direct ?from ?to) (succ ?d1 ?d2))
    :effect (and (not (at ?p ?from ?d1)) (at ?p ?to ?d2))
  )
)