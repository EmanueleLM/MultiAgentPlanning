(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
    (attending ?p - person ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (available alan ?s)
      (available nancy ?s)
      (available patricia ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (attending alan ?s)
      (attending nancy ?s)
      (attending patricia ?s)
    )
  )
)