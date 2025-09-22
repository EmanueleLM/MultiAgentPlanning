(define (domain orchestrated_trip)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types city day)

  (:predicates
    (in ?c - city ?d - day)            ; traveler is in city on a given day
    (direct ?from - city ?to - city)  ; direct flight connectivity
    (next ?d1 - day ?d2 - day)        ; temporal ordering of days
    (occupied ?d - day)               ; a day has been assigned (prevent double-assignment)
    (meeting-allowed ?d - day)        ; precomputed predicate for allowed meeting days
    (met-friends)                     ; meeting occurred
  )

  (:functions
    (total-cost) ; used only for :action-costs optimization
  )

  ; Stay in the same city from one day to the next
  (:action assign-day-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (in ?c ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (in ?c ?d2)
      (occupied ?d2)
      (increase (total-cost) 1)
    )
  )

  ; Fly via a direct flight from one city to another between consecutive days
  (:action assign-day-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (in ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (in ?to ?d2)
      (occupied ?d2)
      (increase (total-cost) 1)
    )
  )

  ; Meet friends in Nice on an allowed day (instantaneous, zero cost)
  (:action meet-friends-in-nice
    :parameters (?d - day)
    :precondition (and
      (in nice ?d)
      (meeting-allowed ?d)
      (not (met-friends))
    )
    :effect (and
      (met-friends)
    )
  )
)