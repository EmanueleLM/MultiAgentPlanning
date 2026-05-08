(define (domain travel-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (in ?c - city ?d - day)        ;; traveler is in city ?c on day ?d
    (assigned ?d - day)           ;; day ?d has been assigned (occupied)
    (next ?d1 - day ?d2 - day)    ;; ?d2 immediately follows ?d1
    (flight ?from - city ?to - city) ;; there is a direct (one-way) flight from ?from to ?to
  )

  ;; Continue staying in the same city on the next day
  (:action occupy_continuation
    :parameters (?c - city ?prev - day ?d - day)
    :precondition (and
      (next ?prev ?d)
      (in ?c ?prev)
      (not (assigned ?d))
    )
    :effect (and
      (in ?c ?d)
      (assigned ?d)
    )
  )

  ;; Travel to a different city on the next day using a direct flight
  (:action occupy_via_flight
    :parameters (?from - city ?to - city ?prev - day ?d - day)
    :precondition (and
      (next ?prev ?d)
      (in ?from ?prev)
      (flight ?from ?to)
      (not (assigned ?d))
    )
    :effect (and
      (in ?to ?d)
      (assigned ?d)
    )
  )
)