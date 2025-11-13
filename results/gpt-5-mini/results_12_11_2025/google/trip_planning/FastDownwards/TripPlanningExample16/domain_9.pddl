(define (domain travel-integration)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (workshop-day ?d - day)
    (ready ?d - day)
    (unassigned ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (last ?c - city)
    (is-prague ?c - city)
    (last-day ?d - day)
  )

  (:action assign-stay-nonworkshop
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (ready ?d)
      (unassigned ?d)
      (next ?d ?nd)
      (last ?c)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (not (ready ?d))
      (ready ?nd)
      (last ?c)
    )
  )

  (:action assign-move-nonworkshop
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (ready ?d)
      (unassigned ?d)
      (next ?d ?nd)
      (last ?from)
      (direct ?from ?to)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?to)
      (not (ready ?d))
      (ready ?nd)
      (not (last ?from))
      (last ?to)
    )
  )

  (:action assign-stay-workshop
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (ready ?d)
      (unassigned ?d)
      (next ?d ?nd)
      (last ?c)
      (workshop-day ?d)
      (is-prague ?c)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (not (ready ?d))
      (ready ?nd)
      (last ?c)
    )
  )

  (:action assign-move-workshop
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (ready ?d)
      (unassigned ?d)
      (next ?d ?nd)
      (last ?from)
      (direct ?from ?to)
      (workshop-day ?d)
      (is-prague ?to)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?to)
      (not (ready ?d))
      (ready ?nd)
      (not (last ?from))
      (last ?to)
    )
  )

  (:action assign-final-stay
    :parameters (?d - day ?c - city)
    :precondition (and
      (last-day ?d)
      (ready ?d)
      (unassigned ?d)
      (last ?c)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (not (ready ?d))
      (last ?c)
    )
  )

  (:action assign-final-move
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (last-day ?d)
      (ready ?d)
      (unassigned ?d)
      (last ?from)
      (direct ?from ?to)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?to)
      (not (ready ?d))
      (not (last ?from))
      (last ?to)
    )
  )
)