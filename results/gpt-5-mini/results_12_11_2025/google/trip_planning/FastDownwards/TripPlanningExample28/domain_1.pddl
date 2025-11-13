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
  )

  ;; Stay in the current city for the current day, schedule that day, advance to next day.
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

  ;; Fly from one city to another on the current day (only if direct), schedule the day as being in the destination city, advance to next day, and change current city.
  (:action fly
    :parameters (?d - day ?from - city ?to - city ?dnext - day)
    :precondition (and
      (current-day ?d)
      (current-city ?from)
      (direct ?from ?to)
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