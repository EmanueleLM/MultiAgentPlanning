(define (domain city-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)                ; in city ?c on day ?d
    (next ?d1 - day ?d2 - day)            ; ?d2 follows ?d1
    (connected ?c1 - city ?c2 - city)     ; direct flight exists between cities
    (attended-workshop)                   ; workshop in Prague has been attended
    (workshop-window ?d - day)            ; day ?d is within allowed workshop window (days 1-3)
    (is-prague ?c - city)                 ; marks which city is Prague
    (prague-visited-3)                    ; flag: Prague occupied on days 1,2,3
    (vienna-visited-3)                    ; flag: Vienna occupied on days 4,5,6
    (porto-visited-3)                     ; flag: Porto occupied on days 7,8,9
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

  ; Mark that Prague was occupied on days 1,2,3 (enables a concise goal without enumerating at(...) atoms).
  (:action mark-prague-3
    :parameters (?c - city ?d1 - day ?d2 - day ?d3 - day)
    :precondition (and
      (is-prague ?c)
      (at ?c ?d1)
      (at ?c ?d2)
      (at ?c ?d3)
    )
    :effect (and
      (prague-visited-3)
    )
  )

  ; Mark that Vienna was occupied on days 4,5,6
  (:action mark-vienna-3
    :parameters (?v - city ?d4 - day ?d5 - day ?d6 - day)
    :precondition (and
      (at ?v ?d4)
      (at ?v ?d5)
      (at ?v ?d6)
    )
    :effect (and
      (vienna-visited-3)
    )
  )

  ; Mark that Porto was occupied on days 7,8,9
  (:action mark-porto-3
    :parameters (?p - city ?d7 - day ?d8 - day ?d9 - day)
    :precondition (and
      (at ?p ?d7)
      (at ?p ?d8)
      (at ?p ?d9)
    )
    :effect (and
      (porto-visited-3)
    )
  )
)