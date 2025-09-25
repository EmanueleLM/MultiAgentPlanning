; Domain: Integrated traveler + flight_planner for a 14-day trip
; Assumptions & resolution of inconsistencies:
; - The traveler requested 6 days Florence, 5 days Barcelona, and 5 days Helsinki (sum 16 > 14).
;   To obtain a feasible 14-day plan while preserving the hard constraints (14 total days, meeting in Florence day9..day14,
;   and only direct flights BCN<->FLO and HEL<->BCN), we allocate:
;     Barcelona = 5 days (day1..day5)
;     Helsinki  = 3 days (day6..day8)  -- reduced to fit total days
;     Florence  = 6 days (day9..day14)
;   This choice preserves Florence = 6 (meeting window) and Barcelona = 5; Helsinki was reduced to fit the total available days.
; - Start city is assumed to be Barcelona (needed to make the problem solvable given available connections).
; - Flights are modeled by the flight_planner actions and do NOT advance the day: flights are instantaneous movements within a day.
; - Stays advance the day (one day consumed per stay). Meeting is an explicit action taken when the traveler is in Florence on a day in the meeting window.
; Agent attribution:
; - Actions prefixed with "traveler-" belong to the traveler agent (stays and meeting).
; - Actions prefixed with "flight_planner-" belong to the flight_planner agent (flights).
(define (domain trip-integration)
  (:requirements :strips)
  (:predicates
    (day ?d)                     ; current day token
    (next ?d ?d2)                ; successor relation between days
    (at ?city)                   ; current location
    (spent ?city ?d)             ; day ?d is spent in city
    (connected ?from ?to)        ; direct flight connectivity (static)
    (meet_window ?d)             ; days allowed for meeting in Florence (day9..day14)
    (met)                        ; meeting goal achieved
  )

  ; Traveler action: stay in the current city for current day and advance to next day
  (:action traveler-stay
    :parameters (?c ?d ?d2)
    :precondition (and (day ?d) (next ?d ?d2) (at ?c))
    :effect (and
              (not (day ?d))
              (day ?d2)
              (spent ?c ?d)
            )
  )

  ; Flight planner action: fly between connected cities (instantaneous w.r.t. days)
  (:action flight_planner-fly
    :parameters (?from ?to)
    :precondition (and (at ?from) (connected ?from ?to))
    :effect (and
              (not (at ?from))
              (at ?to)
            )
  )

  ; Traveler action: meet friend in Florence during allowed meeting window (does not consume a day by itself)
  (:action traveler-meet
    :parameters (?d)
    :precondition (and (day ?d) (meet_window ?d) (at florence))
    :effect (met)
  )
)