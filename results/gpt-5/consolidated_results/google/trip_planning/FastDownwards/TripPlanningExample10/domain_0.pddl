(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (connected ?c1 - city ?c2 - city)
  )

  (:action set-first-day
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (not (assigned ?d))
    )
    :effect (and
      (at ?d ?c)
      (assigned ?d)
    )
  )

  (:action set-next-day
    :parameters (?dprev - day ?d - day ?cprev - city ?c - city)
    :precondition (and
      (assigned ?dprev)
      (next ?dprev ?d)
      (at ?dprev ?cprev)
      (connected ?cprev ?c)
      (not (assigned ?d))
    )
    :effect (and
      (at ?d ?c)
      (assigned ?d)
    )
  )
)