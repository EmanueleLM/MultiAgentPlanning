; Domain: TripPlanningExample19 - 9-day city trip with Brussels hub
; Types:
;  - city: brussels, valencia, nice
;  - day: d1..d9 with a next-chain
; Predicates:
;  - at ?c ?d: traveler is in city c on day d
;  - next ?d ?n: successor relation between days
;  - filled ?d: day d has been assigned to a city
;  - direct ?a ?b: direct flight exists from city a to city b
;  - in_window ?d: days eligible for the Nice meetup window (d1..d6)
;  - visited ?c: city c has been visited at least once
;  - met_friends: the Nice meetup has occurred within the window
; Actions:
;  - stay: remain in the same city from day d to successor n
;  - fly: move between cities from day d to successor n if direct connectivity holds
;  - meet_friends: only when in Nice on an in-window day; can be done once

(define (domain tripplanningexample19)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?n - day)
    (filled ?d - day)
    (direct ?a - city ?b - city)
    (in_window ?d - day)
    (visited ?c - city)
    (met_friends)
  )

  (:action stay
    :parameters (?c - city ?d - day ?n - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?n)
      (not (filled ?n)))
    :effect (and
      (at ?c ?n)
      (filled ?n)
      (visited ?c))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n - day)
    :precondition (and
      (at ?from ?d)
      (next ?d ?n)
      (direct ?from ?to)
      (not (filled ?n)))
    :effect (and
      (at ?to ?n)
      (filled ?n)
      (visited ?to))
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (at nice ?d)
      (in_window ?d)
      (not (met_friends)))
    :effect (and
      (met_friends))
  )
)