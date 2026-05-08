(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; person is in a city on a given day
    (at ?city - city ?d - day)
    ;; day has been assigned to some city (prevents double-assignment)
    (assigned ?d - day)
    ;; direct flight connectivity (one-way; include both directions in problem where applicable)
    (flight ?from - city ?to - city)
    ;; ordering of consecutive days
    (next_day ?d - day ?dnext - day)
    ;; marks the first day of the trip
    (first_day ?d - day)
  )

  ;; Start the trip by assigning the first day to a city.
  ;; Requires the day to be unassigned (ensures at most one city per day).
  (:action start_in
    :parameters (?city - city ?d - day)
    :precondition (and
      (first_day ?d)
      (not (assigned ?d))
    )
    :effect (and
      (at ?city ?d)
      (assigned ?d)
    )
  )

  ;; Stay in the same city on the next day.
  ;; Requires the next day to be unassigned.
  (:action stay
    :parameters (?city - city ?d - day ?dnext - day)
    :precondition (and
      (at ?city ?d)
      (next_day ?d ?dnext)
      (not (assigned ?dnext))
    )
    :effect (and
      (at ?city ?dnext)
      (assigned ?dnext)
    )
  )

  ;; Take a direct flight and be in the destination city on the next day.
  ;; Requires a direct flight link and the next day unassigned.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (at ?from ?d)
      (flight ?from ?to)
      (next_day ?d ?dnext)
      (not (assigned ?dnext))
    )
    :effect (and
      (at ?to ?dnext)
      (assigned ?dnext)
    )
  )
)