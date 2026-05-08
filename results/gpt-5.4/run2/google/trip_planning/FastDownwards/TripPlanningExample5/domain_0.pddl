(define (domain european_trip_16_days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (at_day ?c - city ?d - day)
    (assigned ?d - day)
    (current_day ?d - day)
    (started)
    (finished)
  )

  (:action initialize_at_oslo
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned day_1))
    )
    :effect (and
      (started)
      (assigned day_1)
      (current_day day_1)
      (at_day oslo day_1)
    )
  )

  (:action initialize_at_porto
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned day_1))
    )
    :effect (and
      (started)
      (assigned day_1)
      (current_day day_1)
      (at_day porto day_1)
    )
  )

  (:action initialize_at_dubrovnik
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned day_1))
    )
    :effect (and
      (started)
      (assigned day_1)
      (current_day day_1)
      (at_day dubrovnik day_1)
    )
  )

  (:action stay_to_next
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at_day ?c ?d)
      (not (assigned ?nd))
    )
    :effect (and
      (at_day ?c ?nd)
      (assigned ?nd)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly_to_next
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at_day ?from ?d)
      (direct ?from ?to)
      (not (assigned ?nd))
      (not (at_day ?to ?d))
    )
    :effect (and
      (at_day ?to ?nd)
      (assigned ?nd)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action finalize
    :parameters ()
    :precondition (and
      (current_day day_16)
      (assigned day_16)
    )
    :effect (and
      (finished)
    )
  )
)