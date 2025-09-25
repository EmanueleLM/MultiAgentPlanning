(define (domain trip_planning)
  (:requirements :strips :typing :fluents :negative-preconditions :equality)
  (:types city agent)
  (:constants
    krakow frankfurt dubrovnik - city
    krakow_agent dubrovnik_agent frankfurt_agent - agent
  )
  (:predicates
    (in ?c - city)             ; current location of the traveler
    (visited ?c - city)        ; city visited at least once
  )
  (:functions
    (day)                      ; current day index (start at 1). After finishing day 10, day should be 11.
  )

  ; ----- Actions belonging to the Dubrovnik agent (distinct action names) -----
  (:action stay-dubrovnik_agent
    :parameters ()
    :precondition (in dubrovnik)
    :effect (and
      (visited dubrovnik)
      (increase (day) 5)          ; allocate 5 days in Dubrovnik (tradeoff from requested 7 -> 5)
    )
  )

  (:action fly-dubrovnik_agent-to-frankfurt
    :parameters ()
    :precondition (in dubrovnik)
    :effect (and
      (not (in dubrovnik))
      (in frankfurt)
    )
  )

  ; ----- Actions belonging to the Frankfurt agent -----
  (:action stay-frankfurt_agent
    :parameters ()
    :precondition (in frankfurt)
    :effect (and
      (visited frankfurt)
      (increase (day) 3)          ; allocate 3 days in Frankfurt (keeps Frankfurt preference)
    )
  )

  (:action fly-frankfurt_agent-to-krakow
    :parameters ()
    :precondition (in frankfurt)
    :effect (and
      (not (in frankfurt))
      (in krakow)
    )
  )

  (:action fly-frankfurt_agent-to-dubrovnik
    :parameters ()
    :precondition (in frankfurt)
    :effect (and
      (not (in frankfurt))
      (in dubrovnik)
    )
  )

  ; ----- Actions belonging to the Krakow agent -----
  ; Special action to attend the wedding: must begin on day 9 and consumes 2 days (days 9 and 10).
  (:action attend-wedding-krakow_agent
    :parameters ()
    :precondition (and (in krakow) (= (day) 9))
    :effect (and
      (visited krakow)
      (increase (day) 2)          ; attend wedding and spend 2 days in Krakow (days 9 and 10)
    )
  )

  (:action stay-krakow_agent
    :parameters ()
    :precondition (in krakow)
    :effect (and
      (visited krakow)
      (increase (day) 2)          ; general 2-day stay for Krakow preference (keeps Krakow preference)
    )
  )

  ; Note: There is deliberately no direct flight action between Dubrovnik and Krakow,
  ; because public information states there is no direct flight between Dubrovnik and Krakow.
)