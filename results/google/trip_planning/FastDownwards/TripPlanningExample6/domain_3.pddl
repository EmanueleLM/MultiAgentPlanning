(define (domain trip8days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)
    (cur ?d - day)
    (next ?d1 - day ?d2 - day)
    (edge ?from - city ?to - city)
    (visited ?c - city ?d - day)
    (seen ?c - city)
    (required-berlin-day ?d - day)
    (attended ?d - day)
    (is-berlin ?c - city)
    (final-day ?d - day)
    (finished)
  )

  (:action stay-and-advance
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and (cur ?d) (next ?d ?d2) (at ?c))
    :effect (and
      (visited ?c ?d)
      (seen ?c)
      (not (cur ?d))
      (cur ?d2)
    )
  )

  (:action fly-and-advance
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and (cur ?d) (next ?d ?d2) (at ?from) (edge ?from ?to))
    :effect (and
      (visited ?from ?d)
      (seen ?from)
      (not (at ?from))
      (at ?to)
      (not (cur ?d))
      (cur ?d2)
    )
  )

  (:action attend-berlin
    :parameters (?d - day ?c - city)
    :precondition (and
      (cur ?d)
      (at ?c)
      (is-berlin ?c)
      (required-berlin-day ?d)
      (not (attended ?d))
    )
    :effect (and
      (attended ?d)
    )
  )

  (:action finish-day
    :parameters (?d - day ?c - city)
    :precondition (and (cur ?d) (final-day ?d) (at ?c))
    :effect (and
      (visited ?c ?d)
      (seen ?c)
      (not (cur ?d))
      (finished)
    )
  )
)