(define (domain sf_meet_carol)
  (:requirements :strips :typing)
  (:types agent friend location time)
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - time)
    (can-wait ?t1 - time ?t2 - time)
    (can-travel ?from - location ?to - location ?t1 - time ?t2 - time)
    (meeting-interval ?t1 - time ?t2 - time)
    (full-interval ?t1 - time ?t2 - time)
    (friend-at ?f - friend ?l - location)
    (met ?f - friend)
    (full-meet-with ?f - friend)
  )

  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?l)
      (at-time ?t1)
      (can-wait ?t1 ?t2)
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?from)
      (at-time ?t1)
      (can-travel ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action meet_carol_full
    :parameters (?a - agent ?f - friend ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (friend-at ?f ?l)
      (at ?a ?l)
      (at-time ?t1)
      (full-interval ?t1 ?t2)
    )
    :effect (and
      (met ?f)
      (full-meet-with ?f)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action meet_carol_interval
    :parameters (?a - agent ?f - friend ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (friend-at ?f ?l)
      (at ?a ?l)
      (at-time ?t1)
      (meeting-interval ?t1 ?t2)
    )
    :effect (and
      (met ?f)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )
)