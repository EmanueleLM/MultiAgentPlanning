(define (domain trip-multiagent)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city)
    (direct ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (workshop-window ?d - day)
    (workshop-city ?c - city)
    (attended)
    (available ?d - day)
    (assigned ?d - day)
  )

  (:action fly_flight_agent
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
                    (direct ?from ?to)
                    (at ?from ?d1)
                    (next ?d1 ?d2)
                    (available ?d2)
                  )
    :effect (and
              (not (available ?d2))
              (assigned ?d2)
              (at ?to ?d2)
              (visited ?to)
            )
  )

  (:action stay_stay_agent
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
                    (at ?c ?d1)
                    (next ?d1 ?d2)
                    (available ?d2)
                  )
    :effect (and
              (not (available ?d2))
              (assigned ?d2)
              (at ?c ?d2)
              (visited ?c)
            )
  )

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