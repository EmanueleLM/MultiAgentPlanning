; Domain: itinerary-planning
; Assumptions (explicit, treated as hard facts because no traveler_info/network_info were provided):
; - Starting city is Split.
; - The provided flight network was not supplied; to produce a feasible plan that visits all required cities
;   using only direct flights, the domain assumes direct (bidirectional) flights between Split, Manchester, and Riga.
; - The traveler requires a strict itinerary of exactly 15 days. Day counting starts at 1 in the initial state,
;   and each travel or day-allocation action increases the day counter by 1. Actions are only allowed while
;   (current-day) <= 14 so that after the last allowed action the day becomes 15.
; These assumptions are encoded as comments and hard predicates/functions in the problem below.

(define (domain itinerary)
  (:requirements :typing :fluents)
  (:types city)

  (:predicates
    (at ?c - city)               ; traveler is at city
    (visited ?c - city)          ; city has been visited at least once
    (direct ?from ?to - city)    ; there is a direct flight from 'from' to 'to'
  )

  (:functions
    (current-day)                ; numeric current day counter (integer)
  )

  ; Travel action: move via a direct flight and consume one day.
  ; Precondition: at origin, there exists a direct flight, and there is at least one day available
  ; (we allow action only when current-day <= 14 so that the resulting day can become 15).
  (:action travel
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (<= (current-day) 14)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (increase (current-day) 1)
    )
  )

  ; Day-allocation action: stay/spend a day in the current city (counts as visiting it)
  ; Precondition: at city and can advance day (current-day <= 14).
  (:action allocate-day
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (<= (current-day) 14)
    )
    :effect (and
      (visited ?c)
      (increase (current-day) 1)
    )
  )
)