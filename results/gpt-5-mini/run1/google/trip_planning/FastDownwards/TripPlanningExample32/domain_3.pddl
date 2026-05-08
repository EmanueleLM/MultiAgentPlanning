(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; person is in a city on a given day
    (at ?city - city ?d - day)
    ;; day has been assigned to some city (prevents double-assignment)
    (assigned ?d - day)
    ;; direct flight connectivity (one-way; provide both directions in problem if applicable)
    (flight ?from - city ?to - city)
    ;; ordering of consecutive days
    (next_day ?d - day ?dnext - day)
    ;; marks the first day of the trip
    (first_day ?d - day)
  )

  ;; start the trip by assigning the first day to a city
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

  ;; stay in the same city on the next day
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

  ;; take a direct flight to another city for the next day
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