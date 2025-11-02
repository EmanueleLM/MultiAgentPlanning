(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)
  (:predicates
    (at ?p - person ?c - city ?d - day)
    (occupied ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
  )

  ;; Stay in the same city from one day to the next
  (:action stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?c ?d1) (next ?d1 ?d2) (not (occupied ?d2)))
    :effect (and (at ?p ?c ?d2) (occupied ?d2))
  )

  ;; Fly from ?from to ?to if a direct flight exists
  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (not (occupied ?d2)))
    :effect (and (at ?p ?to ?d2) (occupied ?d2))
  )
)