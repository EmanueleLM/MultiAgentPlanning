(define (domain multi-agent-scheduling-classical)
  (:requirements :typing :strips :negative-preconditions :adl :action-costs)
  (:types agent person location time)

  (:predicates
    (current-time ?t - time)
    (at-agent ?a - agent ?l - location)
    (at-person ?p - person ?l - location)
    (will-arrive-sunset ?t - time)
    (will-arrive-alamo ?t - time)
    (will-end-meeting ?t - time)
    (in-meeting)
    (met ?p - person)
    (minute-next ?t1 - time ?t2 - time)
    (plus15 ?t1 - time ?t2 - time)
    (plus16 ?t1 - time ?t2 - time)
    (plus17 ?t1 - time ?t2 - time)
    (window-available ?t - time)
  )

  (:action advance-time
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current-time ?t1) (minute-next ?t1 ?t2))
    :effect (and (not (current-time ?t1)) (current-time ?t2))
    :cost 0
  )

  (:action depart-alamo-to-sunset
    :parameters (?tdep - time ?tarr - time)
    :precondition (and (current-time ?tdep) (at-agent traveler alamo) (plus16 ?tdep ?tarr) (not (in-meeting)))
    :effect (and (not (at-agent traveler alamo)) (will-arrive-sunset ?tarr))
    :cost 0
  )

  (:action arrive-sunset
    :parameters (?t - time)
    :precondition (and (current-time ?t) (will-arrive-sunset ?t))
    :effect (and (not (will-arrive-sunset ?t)) (at-agent traveler sunset))
    :cost 0
  )

  (:action depart-sunset-to-alamo
    :parameters (?tdep - time ?tarr - time)
    :precondition (and (current-time ?tdep) (at-agent traveler sunset) (plus17 ?tdep ?tarr) (not (in-meeting)))
    :effect (and (not (at-agent traveler sunset)) (will-arrive-alamo ?tarr))
    :cost 0
  )

  (:action arrive-alamo
    :parameters (?t - time)
    :precondition (and (current-time ?t) (will-arrive-alamo ?t))
    :effect (and (not (will-arrive-alamo ?t)) (at-agent traveler alamo))
    :cost 0
  )

  (:action start-meeting
    :parameters (?ts - time ?tend - time)
    :precondition (and
      (current-time ?ts)
      (at-agent traveler sunset)
      (window-available ?ts)
      (plus15 ?ts ?tend)
      (not (in-meeting))
      (not (met matthew))
    )
    :effect (and (in-meeting) (will-end-meeting ?tend))
    :cost 0
  )

  (:action end-meeting
    :parameters (?t - time)
    :precondition (and (current-time ?t) (will-end-meeting ?t) (in-meeting) (not (met matthew)))
    :effect (and (not (in-meeting)) (not (will-end-meeting ?t)) (met matthew))
    :cost -1
  )
)