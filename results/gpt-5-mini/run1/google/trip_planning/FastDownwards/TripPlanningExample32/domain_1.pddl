(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?c - city ?d - day)            ; traveler is in city ?c on day ?d
    (assigned ?d - day)               ; day ?d has been assigned to some city
    (flight ?from - city ?to - city)  ; direct flight exists from ?from to ?to
    (next_day ?d ?dnext - day)        ; ordering of consecutive days
    (traveler_exists ?p - person)     ; a traveler exists
    (first_day ?d - day)              ; marks the first day (start day)
  )

  ;; Start the trip by assigning the first day to some city
  (:action start_in
    :parameters (?p - person ?city - city ?d - day)
    :precondition (and
      (traveler_exists ?p)
      (first_day ?d)
      (not (assigned ?d))
    )
    :effect (and
      (at ?city ?d)
      (assigned ?d)
    )
  )

  ;; Stay in the same city for the next day
  (:action stay
    :parameters (?p - person ?city - city ?d - day ?dnext - day)
    :precondition (and
      (traveler_exists ?p)
      (at ?city ?d)
      (next_day ?d ?dnext)
      (not (assigned ?dnext))
    )
    :effect (and
      (at ?city ?dnext)
      (assigned ?dnext)
    )
  )

  ;; Fly to a directly connected city for the next day
  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (traveler_exists ?p)
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