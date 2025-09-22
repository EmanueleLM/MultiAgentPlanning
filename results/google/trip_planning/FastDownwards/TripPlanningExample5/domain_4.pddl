(define (domain unified-trip-planning)
  (:requirements :typing :negative-preconditions :adl)
  (:types city day person token)

  (:predicates
    (at-day ?d - day ?c - city)
    (unassigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (at-person ?p - person ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (token-of ?t - token ?c - city)
    (token-free ?t - token)
  )

  (:action assign-day-city
    :parameters (?d - day ?c - city ?t - token)
    :precondition (and (unassigned ?d) (token-of ?t ?c) (token-free ?t))
    :effect (and
              (not (unassigned ?d))
              (at-day ?d ?c)
              (not (token-free ?t))
            )
  )

  (:action stay-city
    :parameters (?d - day ?next - day ?c - city ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d ?c) (unassigned ?next) (token-of ?t ?c) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next ?c)
              (not (token-free ?t))
            )
  )

  (:action flight-assign
    :parameters (?d - day ?next - day ?from - city ?to - city ?t - token)
    :precondition (and (next ?d ?next) (at-day ?d ?from) (unassigned ?next) (direct ?from ?to) (token-of ?t ?to) (token-free ?t))
    :effect (and
              (not (unassigned ?next))
              (at-day ?next ?to)
              (not (token-free ?t))
            )
  )

  (:action init-traveler
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and (unassigned ?d))
    :effect (and
              (at-person ?p ?c ?d)
            )
  )

  (:action fly-agent2
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at-person ?p ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and
              (at-person ?p ?to ?d2)
            )
  )

  (:action stay-agent2
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at-person ?p ?c ?d1) (next ?d1 ?d2))
    :effect (and
              (at-person ?p ?c ?d2)
            )
  )

  (:action sync-person-to-day
    :parameters (?p - person ?d - day ?c - city ?t - token)
    :precondition (and (at-person ?p ?c ?d) (unassigned ?d) (token-of ?t ?c) (token-free ?t))
    :effect (and
              (not (unassigned ?d))
              (at-day ?d ?c)
              (not (token-free ?t))
            )
  )
)