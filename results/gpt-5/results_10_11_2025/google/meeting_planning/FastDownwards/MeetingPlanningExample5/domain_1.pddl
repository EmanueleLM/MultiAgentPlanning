(define (domain sf_meeting_discrete)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location tick)

  (:predicates
    (at ?a - agent ?l - location)
    (in_transit)                                ; true iff the traveler is mid-travel
    (need2 ?from - location ?to - location)     ; 2 travel steps remaining on the current route
    (need1 ?from - location ?to - location)     ; 1 travel step remaining on the current route
    (ready ?from - location ?to - location)     ; ready to arrive after required steps
    (travel_ticks2 ?from - location ?to - location)

    (current_time ?t - tick)
    (next ?t1 - tick ?t2 - tick)

    (can_meet_william ?t - tick)                ; William is available at tick t (12:15 onward in this horizon)

    (mw1) (mw2) (mw3) (mw4)                     ; staged meeting progress
    (met_william_5ticks)                        ; achieved 5 meeting ticks
  )

  ; Start a travel sequence that will require two tick-consuming steps and then an arrival
  (:action begin-travel
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and (at ?p ?from) (travel_ticks2 ?from ?to) (not (in_transit)))
    :effect (and (in_transit) (need2 ?from ?to))
  )

  ; First tick of a 2-tick travel
  (:action travel-step-2
    :parameters (?from - location ?to - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2) (in_transit) (need2 ?from ?to))
    :effect (and (not (current_time ?t)) (current_time ?t2)
                 (not (need2 ?from ?to)) (need1 ?from ?to))
  )

  ; Second tick of travel; after this, agent is ready to arrive
  (:action travel-step-1
    :parameters (?from - location ?to - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2) (in_transit) (need1 ?from ?to))
    :effect (and (not (current_time ?t)) (current_time ?t2)
                 (not (need1 ?from ?to)) (ready ?from ?to))
  )

  ; Instantaneous arrival (no time consumption) after required steps
  (:action arrive
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and (in_transit) (ready ?from ?to) (at ?p ?from))
    :effect (and (not (in_transit)) (not (ready ?from ?to))
                 (not (at ?p ?from)) (at ?p ?to))
  )

  ; Wait one tick (used for idle/waiting time when not traveling)
  (:action wait
    :parameters (?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2) (not (in_transit)))
    :effect (and (not (current_time ?t)) (current_time ?t2))
  )

  ; Meeting William requires being at TheCastro, within his availability, and not in transit.
  ; Five chained actions ensure at least 75 minutes (5 ticks) are accumulated.

  (:action meet-william-1
    :parameters (?p - agent ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p TheCastro) (can_meet_william ?t)
                       (not (in_transit)) (not (mw1)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (mw1))
  )

  (:action meet-william-2
    :parameters (?p - agent ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p TheCastro) (can_meet_william ?t)
                       (not (in_transit)) (mw1) (not (mw2)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (mw2))
  )

  (:action meet-william-3
    :parameters (?p - agent ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p TheCastro) (can_meet_william ?t)
                       (not (in_transit)) (mw2) (not (mw3)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (mw3))
  )

  (:action meet-william-4
    :parameters (?p - agent ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p TheCastro) (can_meet_william ?t)
                       (not (in_transit)) (mw3) (not (mw4)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (mw4))
  )

  (:action meet-william-5
    :parameters (?p - agent ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p TheCastro) (can_meet_william ?t)
                       (not (in_transit)) (mw4) (not (met_william_5ticks)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (met_william_5ticks))
  )
)