(define (domain MeetingPlanningExample24)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals)
  (:types location person)
  (:predicates
    (at ?who - person ?loc - location)
    (connected ?from - location ?to - location)
    (available ?p - person)
    (at_time_available ?p - person)
    (met ?p - person)
  )

  (:durative-action move-nobhill-presidio
    :parameters (?who - person)
    :duration (= ?duration 17)
    :condition (and
      (at start (at ?who nobhill))
      (over all (connected nobhill presidio))
    )
    :effect (and
      (at start (not (at ?who nobhill)))
      (at end (at ?who presidio))
    )
  )

  (:durative-action move-presidio-nobhill
    :parameters (?who - person)
    :duration (= ?duration 18)
    :condition (and
      (at start (at ?who presidio))
      (over all (connected presidio nobhill))
    )
    :effect (and
      (at start (not (at ?who presidio)))
      (at end (at ?who nobhill))
    )
  )

  (:durative-action meet-matthew
    :parameters (?who - person)
    :duration (= ?duration 30)
    :condition (and
      (over all (available matthew))
      (at start (at ?who presidio))
      (over all (at ?who presidio))
    )
    :effect (and
      (at end (met matthew))
    )
  )
)