(define (domain tripplanning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (next ?d - day ?nd - day)
    (current ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
  )

  (:action step-stay
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (current ?d)
      (assigned ?d)
      (at ?d ?c)
      (next ?d ?nd)
      (not (assigned ?nd))
    )
    :effect (and
      (assigned ?nd)
      (at ?nd ?c)
      (not (current ?d))
      (current ?nd)
    )
  )

  (:action step-fly
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (assigned ?d)
      (at ?d ?from)
      (next ?d ?nd)
      (not (assigned ?nd))
      (direct ?from ?to)
    )
    :effect (and
      (assigned ?nd)
      (at ?nd ?to)
      (not (current ?d))
      (current ?nd)
    )
  )
)