(define (domain itinerary-domain)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (next ?d - day ?d2 - day)
  )

  ;; Stay in the same city from one day to the next
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  ;; Fly using a direct flight from one city to another between consecutive days
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (flight ?from ?to))
    :effect (and (at ?to ?d2))
  )
)