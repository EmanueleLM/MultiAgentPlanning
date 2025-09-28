(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs :equality :adl)
  (:types city day preference)
  (:predicates
    (free-day ?d - day)
    (at ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (pref-sat ?p - preference)
    (first-day ?d - day)
    (pref-target ?p - preference ?c - city ?d1 - day ?d2 - day)
  )
  (:action assign-first-day
    :parameters (?c - city ?d - day)
    :precondition (and (free-day ?d) (first-day ?d))
    :effect (and (at ?c ?d) (not (free-day ?d)))
    :cost 0
  )
  (:action assign-next-stay
    :parameters (?c - city ?pd - day ?d - day)
    :precondition (and (free-day ?d) (next ?pd ?d) (at ?c ?pd))
    :effect (and (at ?c ?d) (not (free-day ?d)))
    :cost 0
  )
  (:action assign-next-fly
    :parameters (?from - city ?to - city ?pd - day ?d - day)
    :precondition (and (free-day ?d) (next ?pd ?d) (at ?from ?pd) (direct ?from ?to))
    :effect (and (at ?to ?d) (not (free-day ?d)))
    :cost 0
  )
  (:action pay-pref
    :parameters (?p - preference)
    :precondition (not (pref-sat ?p))
    :effect (pref-sat ?p)
    :cost 1
  )
  (:action satisfy-pref
    :parameters (?p - preference ?c - city ?d1 - day ?d2 - day)
    :precondition (and (pref-target ?p ?c ?d1 ?d2) (at ?c ?d1) (at ?c ?d2) (not (pref-sat ?p)))
    :effect (pref-sat ?p)
    :cost 0
  )
)