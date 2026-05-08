(define (domain travel_itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)         ;; traveler is in city ?c on day ?d
    (assigned ?d - day)            ;; day ?d has been assigned (occupied)
    (free ?d - day)                ;; day ?d is free (not yet assigned)
    (next ?d1 - day ?d2 - day)     ;; ?d2 immediately follows ?d1
    (flight ?from - city ?to - city) ;; there is a direct (one-way) flight from ?from to ?to
  )

  ;; Continue staying in the same city on the next day
  (:action occupy_continuation
    :parameters (?c - city ?prev - day ?d - day)
    :precondition (and
      (next ?prev ?d)
      (at ?c ?prev)
      (free ?d)
    )
    :effect (and
      (at ?c ?d)
      (assigned ?d)
      (not (free ?d))
    )
  )

  ;; Travel to a different city on the next day using a direct flight
  (:action occupy_via_flight
    :parameters (?from - city ?to - city ?prev - day ?d - day)
    :precondition (and
      (next ?prev ?d)
      (at ?from ?prev)
      (flight ?from ?to)
      (free ?d)
    )
    :effect (and
      (at ?to ?d)
      (assigned ?d)
      (not (free ?d))
    )
  )
)