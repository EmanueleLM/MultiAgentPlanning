(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (allowed_for_charlotte ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free kathryn ?s)
      (free charlotte ?s)
      (free lauren ?s)
      (allowed_for_charlotte ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (not (free kathryn ?s))
      (not (free charlotte ?s))
      (not (free lauren ?s))
    )
  )
)