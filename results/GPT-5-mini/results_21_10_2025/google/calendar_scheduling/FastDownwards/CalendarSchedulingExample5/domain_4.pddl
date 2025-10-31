(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (selected ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule-meeting
    :parameters (?s - slot ?k - agent ?c - agent ?l - agent)
    :precondition (and
      (not (meeting-scheduled))
      (free ?k ?s)
      (free ?c ?s)
      (free ?l ?s)
    )
    :effect (and
      (meeting-scheduled)
      (selected ?s)
    )
  )
)