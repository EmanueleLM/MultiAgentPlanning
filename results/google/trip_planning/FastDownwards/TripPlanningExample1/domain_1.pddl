(define (domain travel-itinerary)
  (:requirements :typing :negative-preconditions :fluents)
  (:types city day)
  (:predicates
    (direct ?from - city ?to - city)
    (next ?d - day ?dn - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (visited ?c - city)
  )
  (:functions
    (days-in ?c - city)
    (total-days)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn) (not (assigned ?dn)))
    :effect (and
      (at ?c ?dn)
      (assigned ?dn)
      (visited ?c)
      (increase (days-in ?c) 1)
      (increase (total-days) 1)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (next ?d ?dn) (not (assigned ?dn)))
    :effect (and
      (at ?to ?dn)
      (assigned ?dn)
      (visited ?to)
      (increase (days-in ?to) 1)
      (increase (total-days) 1)
    )
  )
)