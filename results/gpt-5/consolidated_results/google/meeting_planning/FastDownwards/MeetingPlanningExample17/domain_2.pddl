(define (domain meet-matthew-succ)
  (:requirements :strips :typing :negative-preconditions)
  (:types traveler location person tpoint)

  (:predicates
    (at ?a - traveler ?l - location)
    (at-time ?t - tpoint)
    (next ?t1 - tpoint ?t2 - tpoint)
    (leg ?from - location ?to - location ?td - tpoint ?ta - tpoint)
    (meeting-allowed ?p - person ?l - location ?ts - tpoint ?te - tpoint)
    (met ?p - person)
  )

  (:action wait-step
    :parameters (?a - traveler ?t1 - tpoint ?t2 - tpoint)
    :precondition (and
      (at-time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action travel-step
    :parameters (?a - traveler ?from - location ?to - location ?t1 - tpoint ?t2 - tpoint)
    :precondition (and
      (at ?a ?from)
      (at-time ?t1)
      (next ?t1 ?t2)
      (leg ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action meet-span
    :parameters (?a - traveler ?p - person ?l - location ?ts - tpoint ?te - tpoint)
    :precondition (and
      (at ?a ?l)
      (at-time ?ts)
      (next ?ts ?te)
      (meeting-allowed ?p ?l ?ts ?te)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (at-time ?ts))
      (at-time ?te)
    )
  )
)