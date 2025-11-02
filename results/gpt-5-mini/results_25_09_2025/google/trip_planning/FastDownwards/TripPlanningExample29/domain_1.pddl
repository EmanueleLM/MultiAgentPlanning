(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions :equality :adl :action-costs)
  (:types city agent day)
  (:predicates
    (in ?c - city)
    (visited ?c - city)
    (at-day ?d - day)
    (direct-flight ?c1 ?c2 - city)
    (can-advance ?from ?to - day)
  )

  (:action stay-dubrovnik_agent
    :parameters (?from - day ?to - day)
    :precondition (and (in dubrovnik) (at-day ?from) (can-advance ?from ?to))
    :effect (and (not (at-day ?from)) (at-day ?to) (visited dubrovnik))
    :cost 0
  )

  (:action fly-dubrovnik_agent-to-frankfurt
    :parameters ()
    :precondition (and (in dubrovnik) (direct-flight dubrovnik frankfurt))
    :effect (and (not (in dubrovnik)) (in frankfurt))
    :cost 0
  )

  (:action stay-frankfurt_agent
    :parameters (?from - day ?to - day)
    :precondition (and (in frankfurt) (at-day ?from) (can-advance ?from ?to))
    :effect (and (not (at-day ?from)) (at-day ?to) (visited frankfurt))
    :cost 0
  )

  (:action fly-frankfurt_agent-to-krakow
    :parameters ()
    :precondition (and (in frankfurt) (direct-flight frankfurt krakow))
    :effect (and (not (in frankfurt)) (in krakow))
    :cost 0
  )

  (:action fly-frankfurt_agent-to-dubrovnik
    :parameters ()
    :precondition (and (in frankfurt) (direct-flight frankfurt dubrovnik))
    :effect (and (not (in frankfurt)) (in dubrovnik))
    :cost 0
  )

  (:action attend-wedding-krakow_agent
    :parameters (?from - day ?to - day)
    :precondition (and (in krakow) (at-day ?from) (can-advance ?from ?to))
    :effect (and (not (at-day ?from)) (at-day ?to) (visited krakow))
    :cost 0
  )

  (:action stay-krakow_agent
    :parameters (?from - day ?to - day)
    :precondition (and (in krakow) (at-day ?from) (can-advance ?from ?to))
    :effect (and (not (at-day ?from)) (at-day ?to) (visited krakow))
    :cost 0
  )
)