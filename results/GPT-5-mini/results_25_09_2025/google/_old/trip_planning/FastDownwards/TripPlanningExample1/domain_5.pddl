(define (domain integrated-travel)
  (:requirements :strips :typing :equality :fluents :action-costs)
  (:types person city day)

  (:predicates
    (at-person ?p - person ?c - city)
    (direct ?from - city ?to - city)
    (unassigned ?d - day)
    (day-at ?d - day ?c - city)
    (target-split ?d - day)
    (target-manchester ?d - day)
    (target-riga ?d - day)
  )

  (:functions
    (total-cost)
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and (at-person ?p ?from) (direct ?from ?to))
    :effect (and
              (not (at-person ?p ?from))
              (at-person ?p ?to)
              (increase (total-cost) 1)
            )
  )

  (:action assign-day-split
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p split) (unassigned ?d) (target-split ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d split)
            )
  )

  (:action assign-day-manchester
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p manchester) (unassigned ?d) (target-manchester ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d manchester)
            )
  )

  (:action assign-day-riga
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p riga) (unassigned ?d) (target-riga ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d riga)
            )
  )
)