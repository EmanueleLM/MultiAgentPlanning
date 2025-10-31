(define (domain city-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)                ; agent is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)            ; ?d2 is the day after ?d1
    (connected ?c1 - city ?c2 - city)     ; direct flight connection exists between cities
    (attended-workshop)                   ; workshop in Prague has been attended
    (workshop-window ?d - day)            ; day ?d is within the allowed workshop window (days 1-3)
    (is-prague ?c - city)                 ; marks which city is Prague (used to bind workshop)
  )

  ; Stay in the same city from one day to the next
  (:action stay-night
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (at ?c ?d2)
    )
  )

  ; Travel by a direct flight between two connected cities from one day to the next
  (:action travel-flight
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (connected ?from ?to)
    )
    :effect (and
      (at ?to ?d2)
    )
  )

  ; Attend the mandatory workshop in Prague on a day within the workshop window.
  ; This action can only be executed once (ensured by negative precondition).
  (:action attend-workshop
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c ?d)
      (is-prague ?c)
      (workshop-window ?d)
      (not (attended-workshop))
    )
    :effect (and
      (attended-workshop)
    )
  )
)