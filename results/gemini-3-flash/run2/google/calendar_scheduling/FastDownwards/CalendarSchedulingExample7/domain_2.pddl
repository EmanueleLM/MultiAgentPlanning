(define (domain calendar_scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (is_available ?p - person ?s - slot)
    (is_preferred ?s - slot)
    (meeting_scheduled)
    (meeting_at ?s - slot)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (is_available heather ?s)
      (is_available nicholas ?s)
      (is_available zachary ?s)
      (is_preferred ?s)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?s)
    )
  )
)