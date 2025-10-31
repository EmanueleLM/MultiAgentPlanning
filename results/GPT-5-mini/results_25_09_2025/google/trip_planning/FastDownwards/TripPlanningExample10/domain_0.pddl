(define (domain trip-domain)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city)                    ; current location
    (day ?d - day)                    ; current day marker
    (next ?d1 ?d2 - day)              ; successor day relation
    (visited ?c - city)               ; visited a city (spent at least one full day)
    (in-relatives-window ?d - day)    ; day is inside relatives-visit window
    (relatives-visited)               ; relatives have been visited
  )

  ;; Stay actions (one per city / agent). Each stay consumes a day:
  (:action oslo_agent-stay-oslo
    :parameters (?from - day ?to - day)
    :precondition (and (at oslo) (day ?from) (next ?from ?to))
    :effect (and (not (day ?from)) (day ?to) (visited oslo))
  )

  (:action dublin_agent-stay-dublin
    :parameters (?from - day ?to - day)
    :precondition (and (at dublin) (day ?from) (next ?from ?to))
    :effect (and (not (day ?from)) (day ?to) (visited dublin))
  )

  (:action valencia_agent-stay-valencia
    :parameters (?from - day ?to - day)
    :precondition (and (at valencia) (day ?from) (next ?from ?to))
    :effect (and (not (day ?from)) (day ?to) (visited valencia))
  )

  ;; Flight actions (only direct flights provided by agents).
  ;; Flights do not consume a day in this model (they happen within a day).
  (:action oslo_agent-fly-oslo-to-dublin
    :parameters ()
    :precondition (at oslo)
    :effect (and (not (at oslo)) (at dublin))
  )

  (:action dublin_agent-fly-dublin-to-oslo
    :parameters ()
    :precondition (at dublin)
    :effect (and (not (at dublin)) (at oslo))
  )

  (:action dublin_agent-fly-dublin-to-valencia
    :parameters ()
    :precondition (at dublin)
    :effect (and (not (at dublin)) (at valencia))
  )

  (:action valencia_agent-fly-valencia-to-dublin
    :parameters ()
    :precondition (at valencia)
    :effect (and (not (at valencia)) (at dublin))
  )

  ;; Relatives visit: must occur while at Valencia on a day inside the window.
  (:action valencia_agent-visit-relatives
    :parameters (?d - day)
    :precondition (and (at valencia) (day ?d) (in-relatives-window ?d))
    :effect (relatives-visited)
  )
)