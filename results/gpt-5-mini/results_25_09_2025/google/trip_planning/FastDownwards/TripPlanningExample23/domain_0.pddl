(define (domain trip-multiagent)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)            ; be in city ?c on day ?d
    (visited ?c - city)               ; city ?c has been visited at least once
    (direct ?c1 - city ?c2 - city)    ; direct flight exists between ?c1 and ?c2
    (next ?d1 - day ?d2 - day)        ; ordering of days: ?d2 is the day after ?d1
    (workshop-window ?d - day)        ; day ?d is within the workshop attendance window
    (workshop-city ?c - city)         ; city ?c hosts the workshop (Riga)
    (attended)                        ; workshop has been attended
  )

  ;; Flight actions belong to the flight_agent
  (:action fly_flight_agent
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
                    (direct ?from ?to)
                    (at ?from ?d1)
                    (next ?d1 ?d2)
                  )
    :effect (and
              (at ?to ?d2)
              (visited ?to)
            )
  )

  ;; Staying actions belong to the stay_agent (advance one day while remaining in same city)
  (:action stay_stay_agent
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
                    (at ?c ?d1)
                    (next ?d1 ?d2)
                  )
    :effect (and
              (at ?c ?d2)
              (visited ?c)
            )
  )

  ;; Attending the workshop (stay_agent)
  (:action attend_workshop_stay_agent
    :parameters (?c - city ?d - day)
    :precondition (and
                    (workshop-city ?c)
                    (at ?c ?d)
                    (workshop-window ?d)
                  )
    :effect (attended)
  )
)