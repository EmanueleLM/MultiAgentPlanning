(define (domain trip-planning)
  ;; Requirements: strips for basic actions, typing for object types,
  ;; negative-preconditions to prevent assigning the same day twice.
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (succ ?d1 - day ?d2 - day)           ; successor relation over days
    (assigned ?d - day)                 ; day has been allocated/visited
    (at ?c - city ?d - day)             ; traveller is in city ?c on day ?d
    (directflight ?from - city ?to - city) ; allowed direct (directed) flight
  )

  ;; Fly along a direct flight to arrive on the next day.
  ;; Precondition: previous day had traveller at the origin city, there is a direct
  ;; flight, successor day exists, and the successor day is not yet assigned.
  ;; Effect: traveller is at destination city on successor day and that day becomes assigned.
  (:action fly
    :parameters (?from - city ?to - city ?dprev - day ?dcur - day)
    :precondition (and
      (succ ?dprev ?dcur)
      (at ?from ?dprev)
      (directflight ?from ?to)
      (not (assigned ?dcur))
    )
    :effect (and
      (at ?to ?dcur)
      (assigned ?dcur)
    )
  )

  ;; Stay in the same city for the next day.
  ;; Precondition: traveller is at the city on the previous day, successor day exists,
  ;; and the successor day is not yet assigned.
  ;; Effect: traveller remains at same city on successor day and that day becomes assigned.
  (:action stay
    :parameters (?c - city ?dprev - day ?dcur - day)
    :precondition (and
      (succ ?dprev ?dcur)
      (at ?c ?dprev)
      (not (assigned ?dcur))
    )
    :effect (and
      (at ?c ?dcur)
      (assigned ?dcur)
    )
  )
)