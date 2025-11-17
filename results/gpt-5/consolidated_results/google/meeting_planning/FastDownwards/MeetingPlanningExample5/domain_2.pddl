(define (domain sf_meeting_discrete)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location tick)
  (:predicates
    (at ?a - agent ?l - location)
    (in_transit)
    (need2 ?from - location ?to - location)
    (need1 ?from - location ?to - location)
    (ready ?from - location ?to - location)
    (travel_ticks2 ?from - location ?to - location)
    (current_time ?t - tick)
    (next ?t1 - tick ?t2 - tick)
    (can_meet_william ?t - tick)
    (william_meeting_spot ?l - location)
    (mw1) (mw2) (mw3) (mw4)
    (met_william_5ticks)
  )

  (:action begin-travel
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and (at ?p ?from) (travel_ticks2 ?from ?to) (not (in_transit)))
    :effect (and (in_transit) (need2 ?from ?to))
  )

  (:action travel-step-2
    :parameters (?from - location ?to - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2) (in_transit) (need2 ?from ?to))
    :effect (and (not (current_time ?t)) (current_time ?t2)
                 (not (need2 ?from ?to)) (need1 ?from ?to))
  )

  (:action travel-step-1
    :parameters (?from - location ?to - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2) (in_transit) (need1 ?from ?to))
    :effect (and (not (current_time ?t)) (current_time ?t2)
                 (not (need1 ?from ?to)) (ready ?from ?to))
  )

  (:action arrive
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and (in_transit) (ready ?from ?to) (at ?p ?from))
    :effect (and (not (in_transit)) (not (ready ?from ?to))
                 (not (at ?p ?from)) (at ?p ?to))
  )

  (:action wait
    :parameters (?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2) (not (in_transit)))
    :effect (and (not (current_time ?t)) (current_time ?t2))
  )

  (:action meet-william-1
    :parameters (?p - agent ?l - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p ?l) (william_meeting_spot ?l) (can_meet_william ?t)
                       (not (in_transit)) (not (mw1)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (mw1))
  )

  (:action meet-william-2
    :parameters (?p - agent ?l - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p ?l) (william_meeting_spot ?l) (can_meet_william ?t)
                       (not (in_transit)) (mw1) (not (mw2)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (mw2))
  )

  (:action meet-william-3
    :parameters (?p - agent ?l - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p ?l) (william_meeting_spot ?l) (can_meet_william ?t)
                       (not (in_transit)) (mw2) (not (mw3)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (mw3))
  )

  (:action meet-william-4
    :parameters (?p - agent ?l - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p ?l) (william_meeting_spot ?l) (can_meet_william ?t)
                       (not (in_transit)) (mw3) (not (mw4)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (mw4))
  )

  (:action meet-william-5
    :parameters (?p - agent ?l - location ?t - tick ?t2 - tick)
    :precondition (and (current_time ?t) (next ?t ?t2)
                       (at ?p ?l) (william_meeting_spot ?l) (can_meet_william ?t)
                       (not (in_transit)) (mw4) (not (met_william_5ticks)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (met_william_5ticks))
  )
)