(define (domain integrated-travel)
  (:requirements :typing :fluents :negative-preconditions :equality)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day)
    (meet_allowed ?d - day)
    (metfriend)
    (visited ?c - city)
    (is_tallinn ?c - city)
  )

  (:functions
    (days_spent ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and
      (assigned ?d2)
      (at ?c ?d2)
      (visited ?c)
      (increase (days_spent ?c) 1)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (flight ?from ?to) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and
      (assigned ?d2)
      (at ?to ?d2)
      (visited ?to)
      (increase (days_spent ?to) 1)
    )
  )

  (:action meet
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is_tallinn ?c) (meet_allowed ?d) (not (metfriend)))
    :effect (metfriend)
  )
)