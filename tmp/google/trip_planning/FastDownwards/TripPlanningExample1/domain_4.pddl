(define (domain integrated-travel)
  (:requirements :strips :typing :equality :fluents)
  (:types person city day)

  (:predicates
    (at-person ?p - person ?c - city)
    (direct ?from - city ?to - city)
    (unassigned ?d - day)
    (day-at ?d - day ?c - city)
  )

  (:functions
    (split-count)
    (manchester-count)
    (riga-count)
    (days-remaining)
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and (at-person ?p ?from) (direct ?from ?to))
    :effect (and
              (not (at-person ?p ?from))
              (at-person ?p ?to)
            )
  )

  (:action assign-day-split
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p split) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d split)
              (increase (split-count) 1)
              (decrease (days-remaining) 1)
            )
  )

  (:action assign-day-manchester
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p manchester) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d manchester)
              (increase (manchester-count) 1)
              (decrease (days-remaining) 1)
            )
  )

  (:action assign-day-riga
    :parameters (?p - person ?d - day)
    :precondition (and (at-person ?p riga) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d riga)
              (increase (riga-count) 1)
              (decrease (days-remaining) 1)
            )
  )
)