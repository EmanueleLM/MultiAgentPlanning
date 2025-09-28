(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :adl :disjunctive-preconditions :conditional-effects :action-costs)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
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

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (flight ?from ?to) (day-next ?d ?d2))
    :effect (and (not (at ?from ?d)) (at ?to ?d2) (visited ?to ?d2))
    :cost 1
  )

  (:action stay-unsat
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (day-next ?d ?d2))
    :effect (and (not (at ?c ?d)) (at ?c ?d2) (visited ?c ?d2))
    :cost 1
  )

  (:action stay-satisfy-from-0
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (day-next ?d ?d2) (satisfied-0 ?c) (not (pref-used ?c ?d)) (or (desired-2 ?c) (desired-3 ?c)))
    :effect (and
              (pref-used ?c ?d)
              (not (satisfied-0 ?c))
              (satisfied-1 ?c)
              (not (at ?c ?d))
              (at ?c ?d2)
              (visited ?c ?d2)
            )
    :cost 0
  )

  (:action stay-satisfy-from-1
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (day-next ?d ?d2) (satisfied-1 ?c) (not (pref-used ?c ?d)) (or (desired-2 ?c) (desired-3 ?c)))
    :effect (and
              (pref-used ?c ?d)
              (not (satisfied-1 ?c))
              (satisfied-2 ?c)
              (not (at ?c ?d))
              (at ?c ?d2)
              (visited ?c ?d2)
            )
    :cost 0
  )

  (:action stay-satisfy-from-2
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (day-next ?d ?d2) (satisfied-2 ?c) (not (pref-used ?c ?d)) (desired-3 ?c))
    :effect (and
              (pref-used ?c ?d)
              (not (satisfied-2 ?c))
              (satisfied-3 ?c)
              (not (at ?c ?d))
              (at ?c ?d2)
              (visited ?c ?d2)
            )
    :cost 0
  )
)