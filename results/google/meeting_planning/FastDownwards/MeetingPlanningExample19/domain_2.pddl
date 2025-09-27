(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent place time)
  (:predicates
    (at ?a - agent ?p - place)
    (at-time ?t - time)
    (arrive ?from - place ?to - place ?t1 - time ?t2 - time)
    (meeting-window ?t1 - time ?t2 - time)
    (meeting-initiated)
    (meeting-done)
  )

  (:action travel
    :parameters (?a - agent ?from - place ?to - place ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?from)
      (at-time ?t1)
      (arrive ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action initiate-meeting
    :parameters (?initiator - agent ?participant - agent ?place - place ?t1 - time ?t2 - time)
    :precondition (and
      (at ?initiator ?place)
      (at ?participant ?place)
      (at-time ?t1)
      (meeting-window ?t1 ?t2)
      (not (meeting-initiated))
      (not (meeting-done))
    )
    :effect (and
      (meeting-initiated)
    )
  )

  (:action participate-meeting
    :parameters (?participant - agent ?initiator - agent ?place - place ?t1 - time ?t2 - time)
    :precondition (and
      (meeting-initiated)
      (at ?initiator ?place)
      (at ?participant ?place)
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