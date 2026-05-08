(define (domain travel-14days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (day-succ ?d1 - day ?d2 - day)            ; successor relation between days
    (in-city ?c - city ?d - day)              ; traveler is in city on a day
    (assigned ?d - day)                       ; a city has been assigned to a day
    (direct-flight ?from - city ?to - city)   ; allowed direct flight connectivity
    (florence-window ?d - day)                ; days 9..14 are valid meeting-window days
    (city-florence ?c - city)                 ; marks the city object that is Florence
    (florence-met)                            ; true once Florence has been assigned on a window day
  )

  ;; Fly to a non-Florence city on the successor day
  (:action fly-non-florence
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (day-succ ?d1 ?d2)
      (in-city ?from ?d1)
      (direct-flight ?from ?to)
      (not (assigned ?d2))
      (not (city-florence ?to))
    )
    :effect (and
      (assigned ?d2)
      (in-city ?to ?d2)
    )
  )

  ;; Fly to Florence on a successor day that is inside the allowed Florence window;
  ;; this action records that the Florence meeting constraint has been satisfied.
  (:action fly-to-florence-window
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (day-succ ?d1 ?d2)
      (in-city ?from ?d1)
      (direct-flight ?from ?to)
      (not (assigned ?d2))
      (city-florence ?to)
      (florence-window ?d2)
    )
    :effect (and
      (assigned ?d2)
      (in-city ?to ?d2)
      (florence-met)
    )
  )

  ;; Fly to Florence on a successor day that is outside the Florence window;
  ;; allowed but does not satisfy the meeting constraint.
  (:action fly-to-florence-nonwindow
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (day-succ ?d1 ?d2)
      (in-city ?from ?d1)
      (direct-flight ?from ?to)
      (not (assigned ?d2))
      (city-florence ?to)
      (not (florence-window ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in-city ?to ?d2)
    )
  )

  ;; Stay in a non-Florence city for the successor day (no flight required).
  (:action stay-non-florence
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and
      (day-succ ?d1 ?d2)
      (in-city ?city ?d1)
      (not (assigned ?d2))
      (not (city-florence ?city))
    )
    :effect (and
      (assigned ?d2)
      (in-city ?city ?d2)
    )
  )

  ;; Stay in Florence for a successor day that is inside the Florence window;
  ;; this also satisfies the meeting constraint.
  (:action stay-in-florence-window
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and
      (day-succ ?d1 ?d2)
      (in-city ?city ?d1)
      (not (assigned ?d2))
      (city-florence ?city)
      (florence-window ?d2)
    )
    :effect (and
      (assigned ?d2)
      (in-city ?city ?d2)
      (florence-met)
    )
  )

  ;; Stay in Florence for a successor day that is outside the Florence window;
  ;; allowed but does not satisfy the meeting constraint.
  (:action stay-in-florence-nonwindow
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and
      (day-succ ?d1 ?d2)
      (in-city ?city ?d1)
      (not (assigned ?d2))
      (city-florence ?city)
      (not (florence-window ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in-city ?city ?d2)
    )
  )

)