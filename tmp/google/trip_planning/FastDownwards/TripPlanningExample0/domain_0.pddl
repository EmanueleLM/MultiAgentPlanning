(define (domain combined-trip-domain)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types city)

  (:predicates
    (at ?c - city)
    (link ?from - city ?to - city)   ; direct flight link (public info)
    (visited ?c - city)              ; flight-planner bookkeeping
    (met)                            ; meeting performed
  )

  (:functions
    (day)                ; elapsed days, starts at 0, must reach 14
    (spent-florence)     ; days spent in Florence (counted by traveler agent)
    (spent-barcelona)    ; days spent in Barcelona
    (spent-helsinki)     ; days spent in Helsinki
  )

  ;; -----------------------
  ;; Actions contributed by the traveler agent
  ;; (stay actions increment day and per-city spent counters)
  ;; -----------------------

  (:action traveler-stay-florence
    :parameters ()
    :precondition (and (at florence) (< (day) 14))
    :effect (and
              (increase (day) 1)
              (increase (spent-florence) 1)
            )
  )

  (:action traveler-stay-barcelona
    :parameters ()
    :precondition (and (at barcelona) (< (day) 14))
    :effect (and
              (increase (day) 1)
              (increase (spent-barcelona) 1)
            )
  )

  (:action traveler-stay-helsinki
    :parameters ()
    :precondition (and (at helsinki) (< (day) 14))
    :effect (and
              (increase (day) 1)
              (increase (spent-helsinki) 1)
            )
  )

  ;; Meeting action by traveler agent: must be in Florence on a day in [9,14]
  (:action traveler-meet-in-florence
    :parameters ()
    :precondition (and (at florence) (>= (day) 9) (<= (day) 14) (not (met)))
    :effect (and
              (met)
            )
  )

  ;; -----------------------
  ;; Actions contributed by the flight_planner agent
  ;; (generic direct-flight action, uses only provided direct links)
  ;; -----------------------
  (:action flight-fly
    :parameters (?from - city ?to - city)
    :precondition (and
                    (at ?from)
                    (link ?from ?to)
                    (< (day) 14)
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (visited ?to)
              (increase (day) 1)
            )
  )
)