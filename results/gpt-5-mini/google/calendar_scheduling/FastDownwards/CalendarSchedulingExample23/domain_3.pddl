(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (attending ?p - participant ?s - slot)
    (meeting_scheduled ?s - slot)
    (meeting_planned)
  )

  ;; Schedule a single meeting at slot ?s when three participants are free.
  ;; Enforce that no other meeting has been planned (meeting_planned) to keep a single meeting instance.
  (:action schedule_meeting
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (meeting_scheduled ?s))
      (not (meeting_planned))
    )
    :effect (and
      (meeting_scheduled ?s)
      (attending ?p1 ?s)
      (attending ?p2 ?s)
      (attending ?p3 ?s)
      (meeting_planned)
    )
  )
)