(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (current-day ?d - day)
    (next ?d - day ?dn - day)
    (connected ?c1 - city ?c2 - city)
    (workshop-done)
    (is-venice ?c - city)
    (eligible-workshop-day ?d - day)
  )

  (:action assign-day
    :parameters (?prevd - day ?d - day ?prevc - city ?c - city ?dnext - day)
    :precondition (and
      (current-day ?d)
      (next ?prevd ?d)
      (at ?prevc ?prevd)
      (connected ?prevc ?c)
      (next ?d ?dnext)
    )
    :effect (and
      (at ?c ?d)
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )

  (:action assign-day-final
    :parameters (?prevd - day ?d - day ?prevc - city ?c - city)
    :precondition (and
      (current-day ?d)
      (next ?prevd ?d)
      (at ?prevc ?prevd)
      (connected ?prevc ?c)
    )
    :effect (and
      (at ?c ?d)
      (not (current-day ?d))
    )
  )

  (:action hold-workshop
    :parameters (?d - day ?c - city)
    :precondition (and
      (at ?c ?d)
      (is-venice ?c)
      (eligible-workshop-day ?d)
    )
    :effect (workshop-done)
  )
)