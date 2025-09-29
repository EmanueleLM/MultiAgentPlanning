(define (domain itinerary)
  ; Assumptions and resolution of ambiguous inputs:
  ; - Total trip length is 11 days (day1..day11).
  ; - The traveler's raw desired stays were: Frankfurt 4d, Bucharest 2d, Berlin 7d (sum=13), which conflicts with total=11.
  ; - No explicit flexibility was provided; per instructions we minimize deviation from stated preferences while respecting all hard constraints.
  ; - Tie-breaking: prefer keeping Frankfurt at 4 days (private explicit desire), keep Bucharest at 2 days, reduce Berlin by 2 days (from 7->5). This yields a feasible allocation: Berlin 5, Frankfurt 4, Bucharest 2 (sum=11).
  ; - The traveler must attend the Berlin show occurring during days 1..7. Per "always prefer the earliest feasible meeting slot", we schedule Berlin presence earliest: Berlin on days 1-5 (thus attending the show within its window).
  ; - Travel model: each itinerary day must be assigned to exactly one city. Movement from the city on day D to the city on day D+1 is permitted only if a direct flight exists between those two cities. Travel actions move you to the next-day city; they do not create extra (non-counted) days beyond day1..day11.
  ; - Direct flights (shared public information): Berlin <-> Frankfurt, Frankfurt <-> Bucharest. No direct Berlin <-> Bucharest flight. These are enforced as hard constraints.
  ; - The chosen itinerary (minimized deviation and earliest-Berlin) is: days 1-5 = Berlin, days 6-9 = Frankfurt, days 10-11 = Bucharest.
  ; - We encode days as objects day1..day11 and a successor relation succ for day-to-day transitions.
  ; - We use an 'assigned' predicate to ensure each day is assigned only once.
  ; - Stay and travel actions are distinct: 'stay' keeps you in the same city the next day; 'travel' moves you to a different city the next day if a direct flight exists.
  ; - All preferences were treated as strict constraints except those that conflict with total days; conflict was resolved as above.
  ; Notes for FastDownward:
  ; - This domain uses :typing and simple predicates only (no numeric fluents) to maximize compatibility.

  (:requirements :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)        ; you are in city ?c on day ?d
    (assigned ?d - day)           ; day ?d has been assigned (to one city)
    (succ ?d1 - day ?d2 - day)    ; ?d2 is the successor day after ?d1 (d1 -> d2)
    (flight ?c1 - city ?c2 - city) ; direct flight exists between c1 and c2 (directional fact; will be symmetric in init)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (succ ?d ?d2) (not (assigned ?d2)))
    :effect (and (at ?c ?d2) (assigned ?d2))
  )

  (:action travel
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (succ ?d ?d2) (flight ?from ?to) (not (assigned ?d2)))
    :effect (and (at ?to ?d2) (assigned ?d2))
  )
)