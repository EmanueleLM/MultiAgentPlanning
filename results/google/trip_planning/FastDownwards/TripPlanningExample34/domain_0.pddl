(define (domain trip-domain)
  ; Requirements: classical STRIPS only for FastDownwards compatibility
  (:requirements :strips)

  ; Predicates:
  ; - (current-day ?d) : which day the itinerary is currently at (unique)
  ; - (next ?d1 ?d2) : day successor relation (static)
  ; - (at ?city ?d) : the traveler is in ?city on day ?d
  ; - (flight ?from ?to) : a direct flight exists from ?from to ?to (static)
  (:predicates
    (current-day ?d)
    (next ?d1 ?d2)
    (at ?city ?d)
    (flight ?from ?to)
  )

  ; Action: stay in the same city for one day (advances day by one)
  ; Precondition: it is the current day ?d1, the traveler is at the city on ?d1,
  ; and there is a successor day ?d2.
  ; Effect: advance current-day to ?d2 and move the "at" predicate to ?d2.
  (:action stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (current-day ?d1) (at ?city ?d1) (next ?d1 ?d2))
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (not (at ?city ?d1))
      (at ?city ?d2)
    )
  )

  ; Action: fly along a direct flight from ?from to ?to, consuming one day.
  ; Precondition: current day ?d1, traveler at ?from on ?d1, next day ?d2, and a direct flight exists.
  ; Effect: advance day and place traveler at ?to on ?d2.
  (:action fly
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (current-day ?d1) (at ?from ?d1) (next ?d1 ?d2) (flight ?from ?to))
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (not (at ?from ?d1))
      (at ?to ?d2)
    )
  )
)