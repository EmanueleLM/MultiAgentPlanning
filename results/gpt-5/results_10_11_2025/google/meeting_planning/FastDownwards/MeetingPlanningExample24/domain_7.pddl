(define (domain MeetingPlanningExample24)
  (:requirements :typing :negative-preconditions)
  (:types location person timepoint)
  (:constants
    matthew - person
  )
  (:predicates
    (at ?who - person ?loc - location)
    (connected ?from - location ?to - location)
    (current ?t - timepoint)
    (met ?p - person)
    (succ ?t1 - timepoint ?t2 - timepoint)
    (travel ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (meet_window ?t1 - timepoint ?t2 - timepoint)
    (matthew_at ?loc - location)
  )

  (:action wait
    :parameters (?who - person ?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current ?t1)
      (at ?who ?loc)
      (succ ?t1 ?t2)
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
    :parameters (?who - person ?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current ?t1)
      (at ?who ?loc)
      (matthew_at ?loc)
      (meet_window ?t1 ?t2)
      (not (met matthew))
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (met matthew)
    )
  )
)