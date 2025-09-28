(define (domain meet-friends)
  (:requirements :strips :negative-preconditions :equality :typing :action-costs)
  (:types person location time)
  (:constants traveler anthony - person nobhill alamosquare - location)
  (:predicates
    (at ?person - person ?loc - location)
    (met ?person - person)
    (now ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel-arrive ?t1 - time ?t2 - time)
    (meeting-end ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ?from)
      (now ?t1)
      (travel-arrive ?t1 ?t2)
      (connected ?from ?to)
    )
    :effect (and
      (not (at traveler ?from))
      (at traveler ?to)
      (not (now ?t1))
      (now ?t2)
    )
    :cost 11
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (now ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
    )
    :cost 0
  )

  (:action meet-anthony
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at traveler alamosquare)
      (at anthony alamosquare)
      (now ?t1)
      (meeting-end ?t1 ?t2)
      (not (met anthony))
    )
    :effect (and
      (met anthony)
      (not (now ?t1))
      (now ?t2)
    )
    :cost -1
  )
)