(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (meeting_not_scheduled)
    (meeting_scheduled)
    (meeting_start ?s - slot)
  )

  ;; Schedule a single 30-minute meeting starting at slot ?s.
  ;; Preconditions require that the meeting has not already been scheduled
  ;; and that each participant is available at the chosen start slot.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (meeting_not_scheduled)
      (available scott ?s)
      (available gabriel ?s)
      (available christine ?s)
    )
    :effect (and
      (not (meeting_not_scheduled))
      (meeting_scheduled)
      (meeting_start ?s)
    )
  )
)