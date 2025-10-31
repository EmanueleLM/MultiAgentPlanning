; Domain: trip-planning
; Assumptions encoded in the domain:
; - Days are discrete time steps day1..day9; travel actions advance exactly one day (from day D to day D+1).
; - Visiting a city on a given day is recorded with (visited city day) and is not removed, so day-specific visit constraints can be expressed in the goal.
; - Meeting friends in Nice must occur on some day with predicate (allowed-meet day) (days day1..day6).
; - Only the explicitly provided direct flights are available; no direct Nice<->Valencia flight is provided.
(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)               ; traveler is located in city c at day d (stateful; moves forward)
    (visited ?c - city ?d - day)          ; traveler has visited city c on day d (persistent accumulative)
    (direct ?from - city ?to - city)      ; direct flight available from->to (static)
    (next ?d - day ?dn - day)             ; dn is the immediate successor day of d (static)
    (allowed-meet ?d - day)               ; day is within the meeting window in Nice (static)
    (met)                                 ; meeting in Nice has occurred (goal predicate)
  )

  ; Stay in the same city from day d to the next day dn
  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn))
    :effect (and
              (not (at ?c ?d))
              (at ?c ?dn)
              (visited ?c ?dn)
            )
  )

  ; Fly from one city to another in one day, permitted only if a direct flight exists
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (next ?d ?dn))
    :effect (and
              (not (at ?from ?d))
              (at ?to ?dn)
              (visited ?to ?dn)
            )
  )

  ; Meet friends in Nice on an allowed meeting day (only once)
  (:action meet-in-nice
    :parameters (?d - day)
    :precondition (and (at nice ?d) (allowed-meet ?d) (not (met)))
    :effect (and (met))
  )
)