; PDDL domain: trip-scheduling
; Purpose: Model a 16-day trip across three cities (Lisbon, Florence, Copenhagen).
; - Days are discrete objects day1..day16.
; - Each day must be assigned exactly one city.
; - Movement from the city on day D to the city on day D+1 is only allowed if there is a direct flight between those cities (flights are declared in the problem).
; - Conferences (hard constraints) must be attended in Copenhagen on day1 and day7.
;
; Notes / assumptions:
; 1) The traveler's requested stay lengths (Lisbon 7, Florence 4, Copenhagen 7) sum to 18 > total trip length 16.
;    This is inconsistent. To avoid making arbitrary reductions to those requested counts, this domain
;    does NOT hard-enforce numeric stay counts. Instead it enforces the hard temporal constraints (conference days)
;    and the connectivity (direct-flight-only) constraints and lets the planner produce a feasible day-by-day allocation.
;    If you want the planner to optimize toward the requested counts, a separate modelling (e.g., soft penalties
;    or numeric fluents) would be required; per problem instructions we avoid introducing fluents/metrics here.
;
; 2) To permit "staying in the same city" from one day to the next, reflexive flights (city->same-city) are declared
;    in the problem file as explicit flight facts.
;
; 3) Only direct flight actions are modelled. No compound/multi-hop flight actions exist in the domain.
;
; 4) The model is classical (STRIPS-like) with typing and negative preconditions. No durations, fluents or conditional effects.
;
(define (domain trip-scheduling)
  :requirements :typing :negative-preconditions
  :types day city

  :predicates
    (next ?d1 - day ?d2 - day)        ; temporal ordering: ?d2 follows ?d1 (immediate successor)
    (flight ?from - city ?to - city) ; direct flight exists between two cities (including reflexive flights for "stay")
    (at ?d - day ?c - city)          ; on day ?d the traveler is in city ?c
    (assigned ?d - day)              ; day ?d has been assigned a city

  ; Assign the city for the successor day given the city on the previous day and the existence of a flight.
  ; Preconditions:
  ;  - ?d is the immediate successor of ?dprev
  ;  - we are known to be at ?from on ?dprev
  ;  - a direct flight exists from ?from to ?to
  ;  - ?d has not already been assigned
  ; Effects:
  ;  - mark ?d assigned and set at ?d ?to
  (:action assign-next-day
    :parameters (?dprev - day ?d - day ?from - city ?to - city)
    :precondition (and
                    (next ?dprev ?d)
                    (at ?dprev ?from)
                    (flight ?from ?to)
                    (not (assigned ?d))
                  )
    :effect (and
              (assigned ?d)
              (at ?d ?to)
            )
  )
)