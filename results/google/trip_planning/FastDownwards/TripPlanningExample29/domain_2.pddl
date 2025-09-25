(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions :equality :adl :fluents)
  (:types city agent day)
  (:constants krakow frankfurt dubrovnik - city krakow_agent dubrovnik_agent frankfurt_agent - agent)
  (:predicates
    (at-city ?c - city)
    (visited ?c - city)
    (at-day ?d - day)
    (direct-flight ?c1 ?c2 - city)
    (can-advance ?from ?to - day)
  )
  (:functions (total-cost))

  (:action stay-dubrovnik_agent
    :parameters (?from - day ?to - day)
    :precondition (and (at-city dubrovnik) (at-day ?from) (can-advance ?from ?to))
    :effect (and (not (at-day ?from)) (at-day ?to) (visited dubrovnik) (increase (total-cost) 0))
  )

  (:action fly-dubrovnik_agent-to-frankfurt
    :parameters ()
    :precondition (and (at-city dubrovnik) (direct-flight dubrovnik frankfurt))
    :effect (and (not (at-city dubrovnik)) (at-city frankfurt) (increase (total-cost) 0))
  )

  (:action stay-frankfurt_agent
    :parameters (?from - day ?to - day)
    :precondition (and (at-city frankfurt) (at-day ?from) (can-advance ?from ?to))
    :effect (and (not (at-day ?from)) (at-day ?to) (visited frankfurt) (increase (total-cost) 0))
  )

  (:action fly-frankfurt_agent-to-krakow
    :parameters ()
    :precondition (and (at-city frankfurt) (direct-flight frankfurt krakow))
    :effect (and (not (at-city frankfurt)) (at-city krakow) (increase (total-cost) 0))
  )

  (:action fly-frankfurt_agent-to-dubrovnik
    :parameters ()
    :precondition (and (at-city frankfurt) (direct-flight frankfurt dubrovnik))
    :effect (and (not (at-city frankfurt)) (at-city dubrovnik) (increase (total-cost) 0))
  )

  (:action attend-wedding-krakow_agent
    :parameters (?from - day ?to - day)
    :precondition (and (at-city krakow) (at-day ?from) (can-advance ?from ?to))
    :effect (and (not (at-day ?from)) (at-day ?to) (visited krakow) (increase (total-cost) 0))
  )

  (:action stay-krakow_agent
    :parameters (?from - day ?to - day)
    :precondition (and (at-city krakow) (at-day ?from) (can-advance ?from ?to))
    :effect (and (not (at-day ?from)) (at-day ?to) (visited krakow) (increase (total-cost) 0))
  )
)