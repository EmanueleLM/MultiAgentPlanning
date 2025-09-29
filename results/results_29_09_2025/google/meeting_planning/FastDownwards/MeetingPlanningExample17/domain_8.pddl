(define (domain multi-agent-scheduling-classical)
  (:requirements :typing :negative-preconditions :adl :equality :fluents)
  (:types agent person location time)

  (:predicates
    (current-time ?t - time)
    (at-agent ?a - agent ?l - location)
    (at-person ?p - person ?l - location)
    (will-arrive-sunset ?a - agent ?t - time)
    (will-arrive-alamo ?a - agent ?t - time)
    (will-end-meeting ?p - person ?t - time)
    (in-meeting)
    (met ?p - person)
    (minute-next ?t1 - time ?t2 - time)
    (plus15 ?t1 - time ?t2 - time)
    (plus16 ?t1 - time ?t2 - time)
    (plus17 ?t1 - time ?t2 - time)
    (window-available ?t - time)
    (penalized ?p - person)
    (required ?p - person)
    (done-person ?p - person)
  )

  (:functions (total-cost))

  (:action advance-time
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current-time ?t1) (minute-next ?t1 ?t2))
    :effect (and (not (current-time ?t1)) (current-time ?t2))
  )

  (:action depart-alamo-to-sunset
    :parameters (?a - agent ?tdep - time ?tarr - time)
    :precondition (and (current-time ?tdep) (at-agent ?a alamo) (plus16 ?tdep ?tarr) (not (in-meeting)))
    :effect (and (not (at-agent ?a alamo)) (will-arrive-sunset ?a ?tarr))
  )

  (:action arrive-sunset
    :parameters (?a - agent ?t - time)
    :precondition (and (current-time ?t) (will-arrive-sunset ?a ?t))
    :effect (and (not (will-arrive-sunset ?a ?t)) (at-agent ?a sunset))
  )

  (:action depart-sunset-to-alamo
    :parameters (?a - agent ?tdep - time ?tarr - time)
    :precondition (and (current-time ?tdep) (at-agent ?a sunset) (plus17 ?tdep ?tarr) (not (in-meeting)))
    :effect (and (not (at-agent ?a sunset)) (will-arrive-alamo ?a ?tarr))
  )

  (:action arrive-alamo
    :parameters (?a - agent ?t - time)
    :precondition (and (current-time ?t) (will-arrive-alamo ?a ?t))
    :effect (and (not (will-arrive-alamo ?a ?t)) (at-agent ?a alamo))
  )

  (:action start-meeting
    :parameters (?a - agent ?p - person ?ts - time ?tend - time)
    :precondition (and
      (current-time ?ts)
      (at-agent ?a sunset)
      (at-person ?p sunset)
      (window-available ?ts)
      (plus15 ?ts ?tend)
      (not (in-meeting))
      (not (met ?p))
    )
    :effect (and (in-meeting) (will-end-meeting ?p ?tend))
  )

  (:action end-meeting
    :parameters (?a - agent ?p - person ?t - time)
    :precondition (and (current-time ?t) (will-end-meeting ?p ?t) (in-meeting) (not (met ?p)))
    :effect (and (not (in-meeting)) (not (will-end-meeting ?p ?t)) (met ?p))
  )

  (:action penalize-person
    :parameters (?p - person)
    :precondition (and (not (met ?p)) (not (penalized ?p)) (not (required ?p)))
    :effect (and (penalized ?p) (increase (total-cost) 1))
  )

  (:action finalize-person
    :parameters (?p - person)
    :precondition (and (or (met ?p) (penalized ?p)) (not (done-person ?p)))
    :effect (done-person ?p)
  )
)