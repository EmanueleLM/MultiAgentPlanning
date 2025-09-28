(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :adl :fluents)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (day-next ?d - day ?d2 - day)
    (pref-used ?c - city ?d - day)
    (desired-2 ?c - city)
    (desired-3 ?c - city)
    (satisfied-0 ?c - city)
    (satisfied-1 ?c - city)
    (satisfied-2 ?c - city)
    (satisfied-3 ?c - city)
  )
  (:functions (total-cost))

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (flight ?from ?to) (day-next ?d ?d2))
    :effect (and (at ?to ?d2) (increase (total-cost) 1))
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (day-next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action satisfy-pref-from-0
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (not (pref-used ?c ?d)) (satisfied-0 ?c) (or (desired-2 ?c) (desired-3 ?c)))
    :effect (and (pref-used ?c ?d)
                 (when (satisfied-0 ?c) (and (not (satisfied-0 ?c)) (satisfied-1 ?c)))
                 (increase (total-cost) -1))
  )

  (:action satisfy-pref-from-1
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (not (pref-used ?c ?d)) (satisfied-1 ?c) (or (desired-2 ?c) (desired-3 ?c)))
    :effect (and (pref-used ?c ?d)
                 (when (satisfied-1 ?c) (and (not (satisfied-1 ?c)) (satisfied-2 ?c)))
                 (increase (total-cost) -1))
  )

  (:action satisfy-pref-from-2
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (not (pref-used ?c ?d)) (satisfied-2 ?c) (desired-3 ?c))
    :effect (and (pref-used ?c ?d)
                 (when (satisfied-2 ?c) (and (not (satisfied-2 ?c)) (satisfied-3 ?c)))
                 (increase (total-cost) -1))
  )
)