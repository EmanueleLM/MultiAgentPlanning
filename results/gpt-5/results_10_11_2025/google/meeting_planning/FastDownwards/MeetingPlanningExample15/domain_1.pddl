(define (domain meeting_sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (time-is ?t - time)
    (john-available-time ?t - time)
    (edge-wait ?from - time ?to - time)
    (edge-travel ?from - time ?to - time ?l1 - location ?l2 - location)
    (meeting-span-min90 ?from - time ?to - time)
    (meeting-span-extend ?from - time ?to - time)
    (met-john)
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
      (time-is ?t1)
      (edge-wait ?t1 ?t2))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2))
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from)
      (time-is ?t1)
      (edge-travel ?t1 ?t2 ?from ?to))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
      (not (at ?p ?from))
      (at ?p ?to))
  )

  (:action meet-minimum-90
    :parameters (?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?loc)
      (time-is ?t1)
      (meeting-span-min90 ?t1 ?t2)
      (john-available-time ?t1)
      (john-available-time ?t2))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2)
      (met-john))
  )

  (:action extend-meeting-to-window-end
    :parameters (?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?loc)
      (time-is ?t1)
      (meeting-span-extend ?t1 ?t2)
      (john-available-time ?t1)
      (john-available-time ?t2))
    :effect (and
      (not (time-is ?t1))
      (time-is ?t2))
  )
)