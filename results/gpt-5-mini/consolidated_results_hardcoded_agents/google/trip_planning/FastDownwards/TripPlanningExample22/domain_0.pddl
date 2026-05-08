; Domain: itinerary-planning
; Assumptions and resolution of conflicting preferences (encoded here as comments):
; - The traveler requested stays: Frankfurt 4 days, Bucharest 2 days, Berlin 7 days, total desired = 13 > 11.
; - The orchestrator resolves the over-subscription by reducing Berlin stay by 2 days (Berlin 5), yielding:
;     Frankfurt 4, Bucharest 2, Berlin 5 (sums to 11).
;   Rationale: This minimizes total deviation from the stated preferences (total deviation = 2 days)
;   and preserves the requirement to attend the Berlin show (which runs days 1..7).
; - To ensure attendance at the earliest feasible slot, we start the trip in Berlin on day1 and schedule
;   Berlin stays on the earliest days (days 1-5). This satisfies "attend the Berlin show (days 1..7)."
; - Travel is allowed only on direct flight connections explicitly provided:
;     berlin <-> frankfurt
;     frankfurt <-> bucharest
;   There is no direct berlin <-> bucharest flight.
; - Model choices:
;   * Days are discrete objects day1 .. day11.
;   * (at ?city ?day) denotes being in a city on that day.
;   * Travel and stay actions are modeled as transitions that set the city for the next day.
;   * Travel does NOT consume additional days beyond the day-to-day assignment;
;     instead, an action assigns the city for the subsequent day (i.e., we treat travel as
;     happening between day D and day D+1).
;   * To avoid multiple assignments for the same day, we use an (occupied ?day) predicate that
;     prevents more than one action assigning that day.
; - If other choices were required, they are explicitly noted above; no additional connections or
;   availability were invented beyond the provided data.
(define (domain itinerary)
  :requirements :typing :negative-preconditions
  :types city day

  :predicates
    (at ?c - city ?d - day)        ; traveler is in city ?c on day ?d
    (occupied ?d - day)           ; day ?d has already been assigned a city
    (next ?d - day ?d2 - day)     ; temporal next relation: ?d2 is the successor of ?d
    (connected ?c1 - city ?c2 - city) ; direct-flight connectivity (static)

  ; Stay action: remain in the same city for the next day
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
    )
  )

  ; Travel action: move from one city to another on the next day if a direct connection exists
  (:action travel
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (connected ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )
)