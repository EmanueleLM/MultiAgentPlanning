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

  ;; Stay in the current city for the current day and advance to the successor day.
  ;; This schedules the day with the current city and marks the day as scheduled.
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

  ;; Fly on the current day from the current city to a directly connected city,
  ;; but only if an allowed-flight fact for that day exists. The flight schedules
  ;; the day as being in the destination city and advances the day cursor and location.
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