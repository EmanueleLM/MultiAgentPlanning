(define (domain trip-planning)
  (:requirements :strips :typing :fluents)
  (:types city day)
  (:predicates
    (current-day ?d - day)
    (next ?d1 ?d2 - day)
    (at-city ?c - city)
    (visited ?c - city ?d - day)
    (connected ?c1 ?c2 - city)
    (started)
    (not-started)
  )
  (:functions
    (days-in ?c - city)
  )

  (:action start-in
    :parameters (?c - city ?d - day)
    :precondition (and (current-day ?d) (not-started))
    :effect (and
              (started)
              (not (not-started))
              (at-city ?c)
              (visited ?c ?d)
              (increase (days-in ?c) 1)
            )
  )

  (:action stay
    :parameters (?c - city ?d ?d2 - day)
    :precondition (and (current-day ?d) (next ?d ?d2) (at-city ?c))
    :effect (and
              (not (current-day ?d))
              (current-day ?d2)
              (visited ?c ?d2)
              (increase (days-in ?c) 1)
            )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d ?d2 - day)
    :precondition (and (current-day ?d) (next ?d ?d2) (at-city ?from) (connected ?from ?to) (started))
    :effect (and
              (not (current-day ?d))
              (current-day ?d2)
              (not (at-city ?from))
              (at-city ?to)
              (visited ?to ?d2)
              (increase (days-in ?to) 1)
            )
  )
)