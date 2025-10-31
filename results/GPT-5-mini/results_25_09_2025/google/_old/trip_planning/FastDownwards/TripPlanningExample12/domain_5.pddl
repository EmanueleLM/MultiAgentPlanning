(define (domain integrated-travel)
  (:requirements :typing :negative-preconditions :equality :adl :action-costs)
  (:types city day count)

  (:predicates
    (at ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day)
    (meet_allowed ?d - day)
    (metfriend)
    (visited ?c - city)
    (is_tallinn ?c - city)
    (remain ?c - city ?n - count)
    (dec ?n1 - count ?n2 - count)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (not (assigned ?d2))
      (remain ?c ?n1)
      (dec ?n1 ?n2)
    )
    :effect (and
      (assigned ?d2)
      (at ?c ?d2)
      (visited ?c)
      (not (remain ?c ?n1))
      (remain ?c ?n2)
    )
    :cost 0
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at ?from ?d)
      (flight ?from ?to)
      (next ?d ?d2)
      (not (assigned ?d2))
      (remain ?to ?n1)
      (dec ?n1 ?n2)
    )
    :effect (and
      (assigned ?d2)
      (at ?to ?d2)
      (visited ?to)
      (not (remain ?to ?n1))
      (remain ?to ?n2)
    )
    :cost 1
  )

  (:action meet
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c ?d)
      (is_tallinn ?c)
      (meet_allowed ?d)
      (not (metfriend))
    )
    :effect (metfriend)
    :cost 0
  )
)