(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent place time)
  (:predicates
    (at ?a - agent ?p - place)
    (at-time ?t - time)
    (arrive-ggp-ph ?t1 - time ?t2 - time)
    (arrive-ph-ggp ?t1 - time ?t2 - time)
    (meeting-window ?t1 - time ?t2 - time)
    (meeting-initiated)
    (meeting-done)
  )

  (:action traveler-travel-ggp-to-ph
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ggp)
      (at-time ?t1)
      (arrive-ggp-ph ?t1 ?t2)
    )
    :effect (and
      (not (at traveler ggp))
      (at traveler ph)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action traveler-travel-ph-to-ggp
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ph)
      (at-time ?t1)
      (arrive-ph-ggp ?t1 ?t2)
    )
    :effect (and
      (not (at traveler ph))
      (at traveler ggp)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action traveler-initiate-meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ph)
      (at john ph)
      (at-time ?t1)
      (meeting-window ?t1 ?t2)
      (not (meeting-initiated))
      (not (meeting-done))
    )
    :effect (and
      (meeting-initiated)
    )
  )

  (:action john-participate-meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (meeting-initiated)
      (at traveler ph)
      (at john ph)
      (at-time ?t1)
      (meeting-window ?t1 ?t2)
      (not (meeting-done))
    )
    :effect (and
      (not (meeting-initiated))
      (meeting-done)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )
)