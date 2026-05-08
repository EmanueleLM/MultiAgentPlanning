; Domain: trip-planning
; Assumptions documented by the auditor/orchestrator:
; - The original durations (venice:6, florence:6, zurich:2) sum to 14 > total 12.
;   To make the instance feasible while staying conservative, we reconcile to:
;     venice = 5 days, zurich = 2 days, florence = 5 days (sum = 12).
;   This is a minimal adjustment (reduce the two 6-day wishes by 1 each).
; - The transport network is used exactly as given:
;     venice <-> zurich (bidirectional)
;     zurich -> florence (direct one-way)
; - We assume the trip starts in venice on day1 (a necessary, conservative start choice
;   so the itinerary can use the given direct flights without inventing extra nodes).
; - Days are discrete objects day1..day12. Each visiting day must be assigned exactly once.
; - Only :strips, :typing and :negative-preconditions are used so FastDownwards can handle it.
(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (succ ?d1 - day ?d2 - day)     ; day ordering: ?d2 is the successor of ?d1
    (unassigned ?d - day)         ; this visiting day still needs assignment
    (at ?c - city ?d - day)       ; traveller is in city ?c on day ?d
    (directflight ?from - city ?to - city) ; allowed direct flight (directed)
  )

  ; Fly along a direct flight to arrive on the next day.
  (:action fly
    :parameters (?from - city ?to - city ?dprev - day ?dcur - day)
    :precondition (and
      (succ ?dprev ?dcur)
      (at ?from ?dprev)
      (directflight ?from ?to)
      (unassigned ?dcur)
    )
    :effect (and
      (not (unassigned ?dcur))
      (at ?to ?dcur)
    )
  )

  ; Stay in the same city for the next day.
  (:action stay
    :parameters (?c - city ?dprev - day ?dcur - day)
    :precondition (and
      (succ ?dprev ?dcur)
      (at ?c ?dprev)
      (unassigned ?dcur)
    )
    :effect (and
      (not (unassigned ?dcur))
      (at ?c ?dcur)
    )
  )
)