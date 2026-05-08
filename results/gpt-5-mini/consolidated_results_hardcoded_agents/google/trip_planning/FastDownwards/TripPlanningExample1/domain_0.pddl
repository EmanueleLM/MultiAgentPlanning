; Domain: itinerary-domain
; Assumptions (encoded as comments):
; - Traveler is available for all 15 days.
; - Traveler starts in Split on day1.
; - Direct-flight edges provided here are the only available flight connections.
; - To satisfy the requirement "prioritise earliest time", the plan is constrained so Manchester is visited on day2 and Riga on day3 (these are encoded as hard constraints in the problem).
(define (domain itinerary-domain)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)      ; direct-flight edge exists from ?from to ?to
    (at ?c - city ?d - day)               ; traveler is in city ?c on day ?d
    (day-allocated ?d - day)              ; day ?d has been allocated (traveler is somewhere on that day)
    (visited ?c - city)                   ; traveler has visited city ?c (at least once)
    (next ?d1 - day ?d2 - day)            ; temporal ordering: ?d2 is the day after ?d1
  )

  ; Travel by direct flight: being at ?from on day ?d allows arriving at ?to on next day ?d2 if a direct link exists.
  ; Effects mark arrival (at ?to ?d2), mark the city visited, and mark the next day allocated.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (next ?d ?d2))
    :effect (and (at ?to ?d2) (visited ?to) (day-allocated ?d2))
  )

  ; Stay in the same city for the next day.
  ; Effects mark presence on next day, mark the city visited, and mark the next day allocated.
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (at ?c ?d2) (visited ?c) (day-allocated ?d2))
  )
)