(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (current-city ?c - city)
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (unscheduled ?d - day)
    (day-scheduled ?d - day ?c - city)
    (direct ?from - city ?to - city)
    (allowed-flight ?d - day ?from - city ?to - city)
  )

  (:action stay
    :parameters (?d - day ?c - city ?dnext - day)
    :precondition (and
      (current-day ?d)
      (current-city ?c)
      (unscheduled ?d)
      (next ?d ?dnext)
    )
    :effect (and
      (not (unscheduled ?d))
      (day-scheduled ?d ?c)
      (not (current-day ?d))
      (current-day ?dnext)
    )
  )

  (:action fly
    :parameters (?d - day ?from - city ?to - city ?dnext - day)
    :precondition (and
      (current-day ?d)
      (current-city ?from)
      (direct ?from ?to)
      (allowed-flight ?d ?from ?to)
      (unscheduled ?d)
      (next ?d ?dnext)
    )
    :effect (and
      (not (unscheduled ?d))
      (day-scheduled ?d ?to)
      (not (current-day ?d))
      (current-day ?dnext)
      (not (current-city ?from))
      (current-city ?to)
    )
  )
)