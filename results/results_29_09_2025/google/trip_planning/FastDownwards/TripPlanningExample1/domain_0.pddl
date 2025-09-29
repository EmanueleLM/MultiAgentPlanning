; Domain: travel-itinerary
; Assumptions (declared because no explicit traveler_info / network_info were provided):
; - The traveler starts in Split on day d1.
; - Direct flights are available pairwise among Split, Manchester, and Riga (both directions).
; - Each flight or stay moves the itinerary forward exactly one day: actions operate from day d to next day dn.
; - There are 15 days (d1..d15). Day allocation is explicit: each day after d1 must be assigned exactly once by an action.
; These assumptions are encoded as hard constraints in the problem file.
(define (domain travel-itinerary)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (direct ?from - city ?to - city)    ; static: a direct flight exists from -> to
    (next ?d - day ?dn - day)           ; static: successor day relation
    (at ?c - city ?d - day)             ; dynamic: traveler is in city c on day d
    (assigned ?d - day)                 ; dynamic: day d has been allocated (some city assigned)
    (visited ?c - city)                 ; dynamic: city has been visited at least once
  )

  ; Remain in the same city from day d to the next day dn (allocate dn)
  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn) (not (assigned ?dn)))
    :effect (and (at ?c ?dn) (assigned ?dn) (visited ?c))
  )

  ; Fly from one city to another using a direct flight, consuming the next day slot
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (next ?d ?dn) (not (assigned ?dn)))
    :effect (and (at ?to ?dn) (assigned ?dn) (visited ?to))
  )
)