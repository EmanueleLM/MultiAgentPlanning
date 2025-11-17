(define (domain meeting_sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (time-is ?t - time)
    (succ ?t1 - time ?t2 - time)
    (john-available ?t - time)
    (can-wait ?t1 - time ?t2 - time)
    (can-travel ?t1 - time ?t2 - time ?l1 - location ?l2 - location)
    (is-meeting-span-90 ?t1 - time ?t2 - time)
    (meeting-location ?l - location)
    (met-john)
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
      (time-is ?t1)
      (succ ?t1 ?t2)
      (can-wait ?t1 ?t2))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2))
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from)
      (time-is ?t1)
      (succ ?t1 ?t2)
      (can-travel ?t1 ?t2 ?from ?to))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
      (not (at ?p ?from))
      (at ?p ?to))
  )

  (:action meet-minimum-90
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
      (meeting-location ?l)
      (time-is ?t1)
      (succ ?t1 ?t2)
      (is-meeting-span-90 ?t1 ?t2)
      (john-available ?t1)
      (john-available ?t2))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
      (met-john))
  )

  (:action extend-meeting
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
      (meeting-location ?l)
      (time-is ?t1)
      (succ ?t1 ?t2)
      (john-available ?t1)
      (john-available ?t2))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2))
  )
)