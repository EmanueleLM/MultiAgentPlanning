(define (domain travel_multiagent)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)           ; traveler is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)       ; temporal successor relation for days
    (occupied ?d - day)              ; day ?d is already assigned (one city per day)
    (connected ?c1 - city ?c2 - city) ; direct flight connection (symmetric edges given in :init)
  )
  ;; Stay in the same city for the next day (consumes one day)
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
    )
  )
  ;; Fly from one city to another (direct flight) consuming one day
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (connected ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )
)