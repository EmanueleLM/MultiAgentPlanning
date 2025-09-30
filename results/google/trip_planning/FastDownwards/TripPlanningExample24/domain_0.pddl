; Domain: trip
; Assumptions:
; - Only direct connections provided are allowed (Florence<->Amsterdam, Amsterdam<->Riga).
; - Actions advance the itinerary from day d to day d+1 via static next facts.
; - No numeric fluents, durative actions, or conditional effects are used to keep compatibility with Fast Downward.
(define (domain trip)
  (:requirements :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)        ; traveler is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)    ; successor day relation
    (connected ?c1 - city ?c2 - city) ; direct flight connection
  )

  ; Stay in the same city to be present the next day
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  ; Fly from one city to another (only where connected)
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (connected ?from ?to))
    :effect (and (at ?to ?d2))
  )
)