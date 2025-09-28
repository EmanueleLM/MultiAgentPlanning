(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (day-next ?d - day ?d2 - day)
    (pref-used ?c - city ?d - day)
  )
  (:functions
    (satisfied ?c - city)
    (desired ?c - city)
    (cost)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (flight ?from ?to) (day-next ?d ?d2))
    :effect (and (at ?to ?d2))
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (day-next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action satisfy-pref
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (not (pref-used ?c ?d)) (< (satisfied ?c) (desired ?c)))
    :effect (and (pref-used ?c ?d) (increase (satisfied ?c) 1) (increase (cost) -1))
  )
)