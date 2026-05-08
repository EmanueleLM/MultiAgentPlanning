(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (attending ?p - participant ?s - slot)
    (meeting_scheduled ?s - slot)
  )

  ;; Schedule a meeting at a slot when three participants are free.
  ;; The action records the meeting as scheduled and that each participant attends.
  (:action schedule_meeting
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (meeting_scheduled ?s))
    )
    :effect (and
      (meeting_scheduled ?s)
      (attending ?p1 ?s)
      (attending ?p2 ?s)
      (attending ?p3 ?s)
    )
  )
)