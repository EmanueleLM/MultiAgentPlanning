(define (domain MeetingPlanningExample24)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person timepoint)
  (:predicates
    (at ?who - person ?loc - location)
    (connected ?from - location ?to - location)
    (current ?t - timepoint)
    (met ?p - person)
    (can_wait ?t1 - timepoint ?t2 - timepoint)
    (travel ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (meet_window ?t1 - timepoint ?t2 - timepoint)
  )

  (:action wait
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current ?t1)
      (can_wait ?t1 ?t2)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action move
    :parameters (?who - person ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current ?t1)
      (at ?who ?from)
      (connected ?from ?to)
      (travel ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (not (at ?who ?from))
      (at ?who ?to)
    )
  )

  (:action meet_matthew_30
    :parameters (?who - person ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current ?t1)
      (at ?who presidio)
      (meet_window ?t1 ?t2)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (met matthew)
    )
  )
)