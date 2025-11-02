; Domain: 9-day city trip with Brussels hub, STRIPS-compatible for FastDownward
; Types:
;  - city: brussels, valencia, nice
;  - day: d1..d9 with a next-chain
; Predicates:
;  - at ?c ?d: traveler is in city c on day d
;  - next ?d ?n: day successor relation
;  - filled ?d: day d has been assigned
;  - direct ?a ?b: direct flight from city a to city b
;  - in_window ?d: days eligible for the Nice meetup window (d1..d6)
;  - visited ?c: city c has been visited at least once
;  - met_friends: the Nice meetup has occurred (within window)
; Actions:
;  - stay: remain in the same city from day d to next day n
;  - fly: move between cities from day d to next day n if direct connectivity holds
;  - meet_friends: achievable only when in Nice on an in-window day
(define (domain travel9days)
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

  ; Stay in the same city from day d to its successor n
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

  ; Fly between cities from day d to its successor n, only if directly connected
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

  ; Meet friends in Nice during the allowed window
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