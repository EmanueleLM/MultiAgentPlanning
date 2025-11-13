(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (cur ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (booked ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (unbooked ?d - day)
  )

  (:action stay
    :parameters (?d - day ?dnext - day ?c - city)
    :precondition (and (cur ?d) (next ?d ?dnext) (at ?c) (unbooked ?d))
    :effect (and
      (not (cur ?d))
      (cur ?dnext)
      (booked ?d ?c)
      (not (unbooked ?d))
    )
  )

  (:action fly
    :parameters (?d - day ?dnext - day ?c1 - city ?c2 - city)
    :precondition (and (cur ?d) (next ?d ?dnext) (at ?c1) (direct ?c1 ?c2) (unbooked ?d))
    :effect (and
      (not (cur ?d))
      (cur ?dnext)
      (booked ?d ?c1)
      (not (unbooked ?d))
      (not (at ?c1))
      (at ?c2)
    )
  )

  (:action finalize-last-day
    :parameters (?c - city)
    :precondition (and (cur d6) (at ?c) (unbooked d6))
    :effect (and
      (booked d6 ?c)
      (not (cur d6))
      (not (unbooked d6))
    )
  )
)