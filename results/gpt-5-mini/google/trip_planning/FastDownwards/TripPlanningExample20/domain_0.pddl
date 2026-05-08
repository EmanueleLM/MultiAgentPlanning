(define (domain travel-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; traveler is in city C on day D
    (in ?c - city ?d - day)
    ;; day D has been assigned (either stay or arrival)
    (assigned ?d - day)
    ;; successor relation between days: (next d1 d2) means d2 immediately follows d1
    (next ?d1 - day ?d2 - day)
    ;; direct flight connectivity (one-way): a direct flight exists from ?from to ?to
    (flight ?from - city ?to - city)
  )

  ;; Continue staying in the same city for the next day
  (:action occupy-continuation
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

  ;; Arrive at a different city on the next day, only if a direct flight exists
  (:action occupy-via-flight
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